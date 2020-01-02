import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:filesize/filesize.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/drive_io_service.dart';
import 'package:sheety_gui/services/file_selection_service.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/settings_service.dart';
import 'package:sheety_gui/ui/widgets/bottom_status.dart';
import 'package:sheety_gui/ui/widgets/file_icon.dart';
import 'package:sheety_gui/utility.dart';

class ListModel extends BaseModel {
  static const LogicalKeyboardKey keyControl = LogicalKeyboardKey(0x10200000011,
      keyLabel: r'ctrl', debugName: 'Key Control');

  final _settings = locator<SettingsService>();
  final _selection = locator<FileSelectionService>();
  final _driveIO = locator<DriveIOService>();
  final fabKey = GlobalKey();
  final focusNode = FocusNode();

  List<ListItem> listItems = [];
  List<ListItem> selected = [];
  ListItem showingSelected; // Filled with dummy values when multiple selected
  int _lastMulti = 0;

  bool get multiSelect =>
      DateTime.now().millisecondsSinceEpoch - _lastMulti <= 550;

  // ANIMATION

  AnimationController sidebarAnimationController;
  Animation<double> sidebarWidthAnimation;

  AnimationController newButtonAngleAnimationController;
  Animation<double> newButtonAngleAnimation;

  bool showSidebar = false;

  double startX = 0;
  double lastX = 0;

  void refreshFiles() {
    _driveIO.listFiles().then((list) {
      listItems = list;
      notifyListeners();
    });
  }

  void onKey(RawKeyEvent event) {
    if (event.data.logicalKey == keyControl) {
      _lastMulti = DateTime.now().millisecondsSinceEpoch;
    }
  }

  void tapFile(BuildContext context, ListItem item) {
    FocusScope.of(context).requestFocus(focusNode);
    if (selected.contains(item)) {
      selected.remove(item);
      notifyListeners();

      if (multiSelect) {
        if (selected.isEmpty) {
          startCollapse();
        } else {
          updateSelected();
          notifyListeners();
        }
      } else {
        selected = [];
        startCollapse();
      }
    } else {
      showSidebar = true;

      if (!multiSelect) {
        selected.clear();
      }

      selected.add(item);

      updateSelected();
      notifyListeners();
      resetCollapse();
    }
  }

  void updateSelected() {
    if (selected.length > 1) {
      showingSelected = getCombined();
    } else {
      showingSelected = selected[0];
    }
  }

  ListItem getCombined() => ListItem(
      '${selected.length} Selected',
      selected.sumMap((item) => item.size),
      selected.sumMap((item) => item.sheets),
      selected[0].date,
      selected.map((item) => item.id).join(', '));

  String formatDate(int date) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    var format = DateFormat.yMd().add_jm();
    return format.format(dateTime);
  }

  // ANIMATION

  void init(TickerProvider tickProvider) {
    super.init(tickProvider);

    sidebarAnimationController = AnimationController(
        lowerBound: 0,
        upperBound: 250,
        vsync: tickProvider,
        duration: Duration(milliseconds: 500));

    sidebarWidthAnimation =
        Tween<double>(begin: 0, end: 1).animate(sidebarAnimationController);

    sidebarAnimationController.value = 250;

    newButtonAngleAnimationController = AnimationController(
        lowerBound: 0,
        upperBound: 45,
        vsync: tickProvider,
        duration: Duration(milliseconds: 100));

    newButtonAngleAnimation = Tween<double>(begin: 0, end: 1)
        .animate(newButtonAngleAnimationController);
  }

  void sideDragStart(DragStartDetails start) =>
      lastX = startX = start.globalPosition.dx;

  void sideDragUpdate(DragUpdateDetails update) {
    lastX = update.globalPosition.dx;
    sidebarAnimationController.value = max(lastX - startX, 0);
  }

  void sideDragEnd(DragEndDetails end) {
    var percentage = (lastX - startX) / 250;
    var velocity = end.primaryVelocity; // Pixels per second
    if (percentage >= 0.1 || velocity >= 200) {
      sidebarAnimationController.forward(from: lastX - startX).whenComplete(() {
        showSidebar = false;
        notifyListeners();
      });
    }
  }

  /// Shows the sidebar
  TickerFuture resetCollapse() => sidebarAnimationController.reverse();

  /// Collapses the sidebar
  void startCollapse() => sidebarAnimationController.forward().whenComplete(() {
        showSidebar = false;
        showingSelected = null;
        notifyListeners();
      });

  void showNewPopup(BuildContext context) {
    newButtonAngleAnimationController.forward();

    Navigator.of(context).push(CustomDialog(fabKey.globalPaintBounds.center,
        () => newButtonAngleAnimationController.reverse(), () {
      Navigator.of(context).pop();

      inputPrompt(
        context,
        title: 'Insert from drive link',
        body:
            'Paste below a Google Drive link (or file ID) to a file to download and upload to Sheets. The file must be accessable by the logged in user, either by ownership or sharing.',
        hint: 'https://drive.google.com/file/d/file_id',
        buttonText: 'Insert',
        onSubmit: (url) {
          Navigator.of(context).pop();

          final regex = RegExp(r'[-\w]{25,}');

          if (!regex.hasMatch(url)) {
            print('no match: $url');
            return;
          }

          final id = regex.firstMatch(url).group(0);

          print('Cloning $id');

          showLoading();

          _driveIO.insertFromDrive(
            id,
            startUpload: (_) => updateText('Cloning file'),
            statusCallback: (progress, response) {
              updatePercent(progress);

              if (response.status == 'COMPLETE') {
                print(
                    'Request complete, adding ${response.items.length} file(s)');
                listItems.addAll(response.items);
              }
            },
            completeUpload: () => hideLoading(true),
          );
        },
      );
    }, () {
      Navigator.of(context).pop();
      _selection.sendRequest(
          multi: true,
          initialDirectory: r'E:\\DriveStore\\upload', // TODO: Temporary
          selected: (files) {
            if (files.isEmpty) {
              return;
            }

            print('Uploading: $files');

            showLoading();

            _driveIO.uploadFiles(
              files.map((file) => file.path).toList(),
              startUpload: (file) {
                var name = File(file).uri.pathSegments.last;
                updateText('Uploading $name');
              },
              statusCallback: (index, progress, response) {
                updatePercent(progress);

                if (response.status == 'COMPLETE') {
                  print(
                      'Request complete, adding ${response.items.length} file(s)');
                  listItems.addAll(response.items);
                }
              },
              completeUpload: () => hideLoading(true),
            );
          },
          cancelled: () => print('Cancelled file open'));
    }));
  }

  void pressDownload(BuildContext context) {
    if (selected.isEmpty) {
      return;
    }

    var combined = getCombined();
    var downloadText =
        selected.length == 1 ? 'this file' : 'these ${selected.length} files';
    confirmDialog(
      context,
      onAccept: () {
        print('Downloading $selected');

        showLoading();

        final idNameMap = Map<String, ListItem>.fromIterable(selected,
            key: (item) => item.id);

        final idPathMap = Map<String, String>.fromIterable(selected,
            key: (item) => item.id,
            value: (item) => '${Setting.downloadDirectory.value}/${item.name}');

        _driveIO.downloadFiles(idPathMap,
            startDownload: (id) =>
                updateText('Downloading ${idNameMap[id].name}'),
            statusCallback: (index, progress, response) =>
                updatePercent(progress),
            completeDownload: () => hideLoading(true));
      },
      title: 'Confirm Download',
      body:
          'Are you sure you want to download $downloadText? This will take up ${filesize(combined.size)}.',
      acceptText: 'Download',
    );
  }

  void pressRemove(BuildContext context) {
    if (selected.isEmpty) {
      return;
    }

    var combined = getCombined();
    var downloadText =
        selected.length == 1 ? 'this file' : 'these ${selected.length} files';
    confirmDialog(
      context,
      onAccept: () {
        showLoading();

        var idNameMap = Map<String, ListItem>.fromIterable(selected,
            key: (item) => item.id);

        _driveIO.removeFiles(idNameMap.keys.toList(), startRemove: (id) {
          updateText('Removing ${idNameMap[id].name}');
        }, statusCallback: (index, progress, response) {
          updatePercent(progress);

          if (response.status == 'COMPLETE') {
            listItems.remove(selected[index]);
            selected.remove(selected[index]);
            notifyListeners();
          }
        }, completeRemove: () {
          startCollapse();
          hideLoading(true);
        });
      },
      title: 'Confirm Remove',
      body:
          'Are you sure you want to remove $downloadText? This will remove ${filesize(combined.size)} across ${combined.sheets} sheet${combined.sheets != 1 ? 's' : ''}.',
      acceptText: 'Remove',
      acceptColor: Colors.red,
    );
  }
}

class CustomDialog extends PopupRoute {
  final Offset buttonPosition;
  final Function() complete;
  final Function() insert;
  final Function() upload;

  CustomDialog(this.buttonPosition, this.complete, this.insert, this.upload);

  @override
  Color get barrierColor => Colors.white.withAlpha(0);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  static const double height = 100;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      Stack(children: [
        AnimatedBuilder(
          animation: animation,
          builder: (c, child) => Transform.translate(
            offset: Offset(
                buttonPosition.dx - (58 / 2),
                buttonPosition.dy -
                    lerpDouble(100, height + 50, animation.value)),
            child: Transform.scale(
              scale: animation.value,
              child: child,
            ),
          ),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
                side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 50,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _getButton(
                      icon: Icons.link,
                      semanticLabel: 'Insert Shared',
                      onTap: () {
                        print('Insert');
                      }),
                  _getButton(
                    icon: Icons.file_upload,
                    semanticLabel: 'Upload',
                    onTap: upload,
                  ),
                ],
              ),
            ),
          ),
        )
      ]);

  Widget _getButton(
          {@required IconData icon,
          @required Function() onTap,
          String semanticLabel}) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            radius: 50,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(icon, semanticLabel: semanticLabel),
            ),
            onTap: onTap,
          ),
        ),
      );

  @override
  void didComplete(dynamic result) {
    super.didComplete(result);
    complete();
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}
