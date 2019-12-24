import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheety_gui/scoped_model/list_model.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/ui/views/base_view.dart';
import 'package:sheety_gui/ui/widgets/file_icon.dart';

class FileListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FileListViewState();
}

class FileListViewState extends State<FileListView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ListModel>(
      showFab: true,
//      fabAdd: (model) => model.createNew(),
      onModelReady: (model) => model.refreshFiles(),
      builder: (context, child, model) => Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Wrap(
                children: model.listItems.map((item) => FileIcon(listItem: item)).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
