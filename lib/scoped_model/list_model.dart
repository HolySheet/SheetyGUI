import 'dart:math';
import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/file_selection_service.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/utility.dart';

class ListModel extends BaseModel {
  static const LogicalKeyboardKey keyControl = LogicalKeyboardKey(0x10200000011,
      keyLabel: r'ctrl', debugName: 'Key Control');

  final _conn = locator<JavaConnectorService>();
  final _selection = locator<FileSelectionService>();
  final fabKey = GlobalKey();
  final focusNode = FocusNode();

  List<ListItem> listItems = [];
  List<ListItem> selected = [];
  ListItem showingSelected; // Filled with dummy values when multiple selected
  bool multiSelect = false;

  // ANIMATION

  AnimationController sidebarAnimationController;
  Animation<double> sidebarWidthAnimation;

  AnimationController newButtonAngleAnimationController;
  Animation<double> newButtonAngleAnimation;

  bool showSidebar = false;

  double startX = 0;
  double lastX = 0;

  void refreshFiles() {
    _conn
        .send()
        .then((response) => listItems = response.items)
        .whenComplete(notifyListeners);
  }

  void onKey(RawKeyEvent event) {
    multiSelect = event.data.logicalKey == keyControl;
  }

  void tapFile(BuildContext context, ListItem item) {
    FocusScope.of(context).requestFocus(focusNode);
    if (selected.contains(item)) {
      selected.remove(item);
      notifyListeners();

      if (multiSelect) {
        if (selected.isEmpty) {
          sidebarAnimationController.forward().whenComplete(() {
            showSidebar = false;
            showingSelected = null;
            notifyListeners();
          });
        } else {
          updateSelected();
          notifyListeners();
        }
      } else {
        selected = [];
        sidebarAnimationController.forward().whenComplete(() {
          showSidebar = false;
          showingSelected = null;
          notifyListeners();
        });
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

  TickerFuture resetCollapse() => sidebarAnimationController.reverse();

  void showNewPopup(BuildContext context) {
    newButtonAngleAnimationController.forward();

    Navigator.of(context).push(CustomDialog(fabKey.globalPaintBounds.center,
        () => newButtonAngleAnimationController.reverse(), () {
      // TODO: This is temporary
      Navigator.of(context).pop();
      showLoading()?.then((_) => dummyAnimation());
    }, () {
      Navigator.of(context).pop();
      _selection.sendRequest(
          multi: true,
          selected: (files) {
            print('Selected files: $files');
          },
          cancelled: () => print('Cancelled file open'));
    }));
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
                children: [
                  IconButton(
                    icon:
                        Icon(Icons.insert_drive_file, semanticLabel: 'Insert'),
                    // Idk what this should do
                    onPressed: insert,
                  ),
                  IconButton(
                    icon: Icon(Icons.file_upload, semanticLabel: 'Upload'),
                    // Upload a given file
                    onPressed: upload,
                  ),
                ],
              ),
            ),
          ),
        )
      ]);

  @override
  void didComplete(dynamic result) {
    super.didComplete(result);
    complete();
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);
}
