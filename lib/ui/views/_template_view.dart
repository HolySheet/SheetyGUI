import 'package:flutter/material.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';

import 'base_view.dart';

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<BaseModel>(
        builder: (context, child, model) => Scaffold(
          body: Center(child: Text(this.runtimeType.toString()),),
        ));
  }
}