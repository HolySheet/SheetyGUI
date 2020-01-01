import 'package:angles/angles.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sheety_gui/scoped_model/list_model.dart';
import 'package:sheety_gui/ui/views/base_view.dart';
import 'package:sheety_gui/ui/widgets/file_icon.dart';

class FileListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FileListViewState();
}

class FileListViewState extends State<FileListView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final fileTitleDisplay =
        Theme.of(context).textTheme.display1.copyWith(fontSize: 24);
    return BaseView<ListModel>(
      topButtonIcon: Icons.settings,
      topButtonLabel: 'Settings',
      topButtonRoute: '/settings',
      onModelReady: (model) {
        model.refreshFiles();
      },
      fab: (context, model) => FloatingActionButton(
        key: model.fabKey,
        child: AnimatedBuilder(
          animation: model.newButtonAngleAnimation,
          builder: (c, widget) => Transform.rotate(
            angle:
                Angle.fromDegrees(model.newButtonAngleAnimation.value).radians,
            child: widget,
          ),
          child: Icon(Icons.add),
        ),
        onPressed: () => model.showNewPopup(context),
      ),
      builder: (context, child, model) => Row(
        children: [
          Expanded(
            child: RawKeyboardListener(
              focusNode: model.focusNode,
              onKey: model.onKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Wrap(
                      children: model.listItems
                          .map((item) => FileIcon(
                              selected: model.selected.contains(item),
                              listItem: item,
                              onTap: model.tapFile))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (model.showSidebar)
            GestureDetector(
              onHorizontalDragStart: model.sideDragStart,
              onHorizontalDragUpdate: model.sideDragUpdate,
              onHorizontalDragEnd: model.sideDragEnd,
              child: AnimatedBuilder(
                animation: model.sidebarAnimationController,
                builder: (c, widget) => Transform.translate(
                  offset: Offset(model.sidebarWidthAnimation.value, 0),
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
                            child: Text(model.showingSelected.name ?? '',
                                style: fileTitleDisplay),
                          ),
                          lineText(filesize(model.showingSelected.size ?? 0),
                              topPadding: 20),
                          lineText(
                              '${model.showingSelected.sheets ?? ''} Sheet${model.showingSelected.sheets != 1 ? 's' : ''}'),
                          lineText(
                              'Last Modified: ${model.formatDate(model.showingSelected.date ?? 0)}'),
                          lineText('Ownership',
                              style: Theme.of(context).textTheme.body2),
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
                          lineText('Owned by Adam Yarris'),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                sidebarButton('Download', onPressed: () => model.pressDownload(context), color: Colors.blue, padding: EdgeInsets.only(right: 10)),
                                sidebarButton('Remove', onPressed: () => model.pressRemove(context), color: Colors.red, padding: EdgeInsets.only(left: 10)),
                              ],
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
    );
  }

  Widget sidebarButton(String text,
          {@required Function() onPressed,
          Color color,
          Color textColor = Colors.white,
          EdgeInsets padding = EdgeInsets.zero}) =>
      Padding(
        padding: padding,
        child: MaterialButton(
          color: color,
          textColor: textColor,
          child: Text(text),
          onPressed: onPressed,
        ),
      );

  Widget lineText(String text, {TextStyle style, double topPadding = 10}) =>
      Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: style ?? Theme.of(context).textTheme.body1,
          ),
        ),
      );
}
