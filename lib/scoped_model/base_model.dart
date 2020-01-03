import 'dart:async';
import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sheety_gui/scoped_model/list_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/clipboard_service.dart';
import 'package:sheety_gui/ui/widgets/bottom_status.dart';

///
/// A model that handles the bottom loading bar
///
class BaseModel extends Model {
  final _clipboard = locator<ClipboardService>();

  bool _loading = false;

  String loadingText = 'Loading...';
  double loadingPercent = 0;

  AnimationController bottomAnimationController;
  Animation<double> bottomAnimation;

  /// Gets invoked immediately before BaseView#onModelReady()
  @mustCallSuper
  void init(TickerProvider tickerProvider) {
    bottomAnimationController = AnimationController(
        lowerBound: 0,
        upperBound: 50,
        vsync: tickerProvider,
        duration: Duration(milliseconds: 150));

    bottomAnimation =
        Tween<double>(begin: 0, end: 1).animate(bottomAnimationController);
  }

  Future<void> showLoading() {
    if (_loading) {
      return null;
    }
    _loading = true;
    return bottomAnimationController.forward();
  }

  Future<void> hideLoading([bool delayed = false]) {
    if (!_loading) {
      return null;
    }
    _loading = false;

    var completer = Completer<void>();

    Timer(
        Duration(milliseconds: delayed ? BottomStatus.ANIMATION_DURATION : 0),
        () => bottomAnimationController
            .reverse()
            .then((_) => loadingPercent = 0)
            .then((_) => completer.complete()));

    return completer.future;
  }

  void updateText(String text) {
    loadingText = text;

    if (_loading) {
      notifyListeners();
    }
  }

  void updatePercent(double percent) {
    loadingPercent = percent.clamp(0, 1).toDouble();

    if (_loading) {
      notifyListeners();
    }
  }

  void confirmDialog(BuildContext context,
      {@required Function() onAccept,
      @required String title,
      @required String body,
      Function() onCancel,
      String cancelText = 'Cancel',
      String acceptText = 'Accept',
      Color acceptColor = Colors.blue}) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            child: Text(cancelText),
            onPressed: () {
              Navigator.of(context).pop();
              onCancel?.call();
            },
          ),
          RaisedButton(
            color: acceptColor,
            child: Text(acceptText),
            onPressed: () {
              Navigator.of(context).pop();
              onAccept();
            },
          )
        ],
      ),
    );
  }

  void inputPrompt(
    BuildContext context, {
    @required Function(String) onSubmit,
    @required String title,
    @required String body,
    Function() onCancel,
    String buttonText,
    String hint,
  }) {
    final controller = TextEditingController();
    var previousText = '';
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: ContinuousRectangleBorder(),
        child: IntrinsicWidth(
          stepWidth: 56.0,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280, maxWidth: 750),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.title,
                      child: Semantics(
                        namesRoute: true,
                        child: Text(title),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
                  child: Column(
                    children: [
                      Text(body),
                      TextField(
                        controller: controller,
                        onChanged: (text) {
                          var selection = controller.selection;
                          var base = selection.baseOffset;
                          var end = selection.extentOffset;
                          var codeUnit = text.codeUnitAt(base - 1);
                          if (codeUnit == 22) {
                            // Ctrl + V
                            var left = text.substring(
                                0, max(0, base - 1)); // -1 to get rid of 22
                            var right = text.substring(end, text.length);

                            controller.text = '$left$right';
                            _clipboard.getClipboard().then((clipboard) {
                              clipboard ??= '';
                              controller.text = '$left$clipboard$right';
                              controller.selection = TextSelection.fromPosition(
                                  TextPosition(
                                      offset: left.length + clipboard.length));
                            });
                          } else if (codeUnit == 1) {
                            // Ctrl + A
                            var codes =
                                previousText.codeUnits.toList(growable: true);
                            codes.removeWhere((c) => c == 1);
                            text = String.fromCharCodes(codes);
                            controller.text = text;
                            controller.selection = TextSelection(
                                baseOffset: 0, extentOffset: text.length);
                          }

                          previousText = controller.text;
                        },
                        decoration: InputDecoration(
                          hintText: hint,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MaterialButton(
                              child: Text(buttonText),
                              textColor: Colors.white,
                              color: Colors.blue,
                              onPressed: () => onSubmit(controller.text),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
