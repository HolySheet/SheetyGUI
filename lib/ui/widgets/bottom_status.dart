import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';

class BottomStatus extends StatelessWidget {
  final Widget child;
  final BaseModel model;

  BottomStatus({this.child, this.model});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: <Widget>[
          child,
          IgnorePointer(
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedBuilder(
                    animation: model.bottomAnimationController,
                    builder: (context, child) => Transform.translate(
                      offset: Offset(0, 50 - model.bottomAnimation.value),
                      child: child,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: max(300, screenSize.width / 3),
                      child: Material(
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(model.loadingText),
                              SizedBox(height: 5),
                              Center(
                                  child: LinearPercentIndicator(
                                width: max(300, screenSize.width / 3).toDouble() - 20,
                                animation: true,
                                animationDuration: 500,
                                animateFromLastPercent: true,
                                lineHeight: 8.0,
                                percent: model.loadingPercent,
                                progressColor: Colors.blue,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
