import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sheety_gui/scoped_model/list_model.dart';
import 'package:sheety_gui/ui/views/base_view.dart';

class FileListView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => FileListViewState();

}

class FileListViewState extends State<FileListView> {

  @override
  Widget build(BuildContext context) {
    return BaseView<ListModel>(
      showFab: true,
      fabAdd: (model) => model.sssss(),
      onModelReady: (model) => model.click(),
      builder: (context, child, model) => Container(
          color: Colors.red,
      ),
    );
  }

}