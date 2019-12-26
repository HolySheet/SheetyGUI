import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sheety_gui/enums/view_states.dart';

///
/// A model that handles the [ViewState] and basic navigation.
///
class BaseModel extends Model {
  ViewState _state;

  ViewState get state => _state;

  AnimationController newButtonAngleAnimationController;
  Animation<double> newButtonAngleAnimation;

  bool _showNew = false;

  bool get showNew => _showNew;

  final fabKey = GlobalKey();

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  void baseInit(SingleTickerProviderStateMixin tickProvider) {
    newButtonAngleAnimationController = AnimationController(
        lowerBound: 0,
        upperBound: 45,
        vsync: tickProvider,
        duration: Duration(milliseconds: 100));

    newButtonAngleAnimation = Tween<double>(begin: 0, end: 1)
        .animate(newButtonAngleAnimationController);
  }

  void showNewPopup(BuildContext context) {
    _showNew = true;
    newButtonAngleAnimationController.forward();

    var bounds = fabKey.globalPaintBounds;

    Navigator.of(context).push(CustomDialog(bounds.center, () => hideNew()));
  }

  void hideNew() {
    _showNew = false;
    newButtonAngleAnimationController.reverse();
  }
}

extension GlobalKeyEx on GlobalKey {
  Rect get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null)?.getTranslation();
    if (translation != null && renderObject.paintBounds != null) {
      return renderObject.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

class CustomDialog extends PopupRoute {
  final Offset buttonPosition;
  final Function() complete;

  CustomDialog(this.buttonPosition, this.complete);

  @override
  Color get barrierColor => Colors.white.withAlpha(0);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  static const double height = 100;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => Stack(children: [
        AnimatedBuilder(
          animation: animation,
          builder: (c, child) => Transform.translate(
            offset: Offset(buttonPosition.dx - (58 / 2), buttonPosition.dy - lerpDouble(100, height + 50, animation.value)),
            child: Transform.scale(
              scale: animation.value,
              child: child,
            ),
          ),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 50,
              height: height,
              child: Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.insert_drive_file),
                    onPressed: () => print('Insert file'),
                  ),
                  IconButton(
                    icon: Icon(Icons.file_upload),
                    onPressed: () => print('Upload'),
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
