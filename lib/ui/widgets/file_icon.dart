import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:sheety_gui/services/payload/list_response.dart';

class FileIcon extends StatefulWidget {
  final bool selected;
  final ListItem listItem;
  final Function(BuildContext, ListItem) onTap;

  FileIcon({Key key, this.selected, this.listItem, this.onTap}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FileIconState(listItem, onTap);
}

class FileIconState extends State<FileIcon> {
  final ListItem listItem;
  final Function(BuildContext, ListItem) onTap;

  FileIconState(this.listItem, this.onTap);

  @override
  Widget build(BuildContext context) => Card(
    elevation: widget.selected ? 10 : 5,
        shape: RoundedRectangleBorder(side: widget.selected ? BorderSide(color: Colors.blue) : BorderSide.none, borderRadius: BorderRadius.circular(4)),
        margin: EdgeInsets.all(10),
        child: SizedBox(
            width: 125,
            height: 125,
            child: GestureDetector(
              onTap: () => onTap?.call(context, listItem),
              onSecondaryTapDown: (tdd) => print('Secondary'),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                    child: Icon(
                      OMIcons.insertDriveFile,
                      size: 75,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: SizedBox(
                      width: 125,
                      height: 35,
                      child: Text(listItem.name, textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
        ),
      );
}
