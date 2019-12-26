import 'package:filesize/filesize.dart';
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

class FileListViewState extends State<FileListView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final fileTitleDisplay =
        Theme.of(context).textTheme.display1.copyWith(fontSize: 24);
    return BaseView<ListModel>(
      showFab: true,
      onModelReady: (model) {
        model.refreshFiles();
        model.init(this);
      },
      builder: (context, child, model) => Expanded(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Wrap(
                      children: model.listItems
                          .map((item) => FileIcon(
                              selected: model.selected == item,
                              listItem: item,
                              onTap: model.tapFile))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
//              if (!model.isCollapsed)
            if (!model.isCollapsed)
              GestureDetector(
                onHorizontalDragStart: model.sideDragStart,
                onHorizontalDragUpdate: model.sideDragUpdate,
                onHorizontalDragEnd: model.sideDragEnd,
                child: AnimatedBuilder(
                  animation: model.animationController,
                  builder: (c, widget) => Transform.translate(
                    offset: Offset(model.widthAnimation.value, 0),
                    child: widget,
                  ),
                  child: SizedBox(
                    width: 250,
                    height: double.infinity,
                    child: Card(
                      shape: ContinuousRectangleBorder(),
                      elevation: 5,
                      margin: EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(model.selected?.name ?? '',
                                  style: fileTitleDisplay),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  filesize(model.selected?.size ?? 0),
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  '${model.selected?.sheets ?? ''} Sheets',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Last Modified: ${model.formatDate(model.selected?.date ?? 0)}',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Ownership',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.body2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Icon(Icons.link),
                                    SizedBox(width: 10),
                                    Text(
                                      'Shared',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Owned by Adam Yarris',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.body1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
