import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

///
/// A model that handles the bottom loading bar
///
class BaseModel extends Model {
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

  Future<void> hideLoading() {
    if (!_loading) {
      return null;
    }
    _loading = false;
    return bottomAnimationController.reverse()
        .then((_) => loadingPercent = 0);
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
      Function() onCancel,
      String title,
      String body,
      String cancelText = 'Cancel',
      String acceptText,
      Color acceptColor = Colors.blue}) async {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
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
        );
      },
    );
  }

  void dummyAnimation() {
    print('Dummy animation');

    loadingPercent = 0;
    notifyListeners();

    Timer.periodic(Duration(milliseconds: 500), (t) {
      if ((loadingPercent += 0.1) > 1) {
        hideLoading();
        t.cancel();
        return;
      } else {
        notifyListeners();
      }
    });
  }
}

enum ConfirmAction { CANCEL, ACCEPT }
