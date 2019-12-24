import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:sheety_gui/services/payload/list_response.dart';

class FileIcon extends StatefulWidget {
  final ListItem listItem;

  const FileIcon({Key key, this.listItem}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FileIconState(listItem);
}

class FileIconState extends State<FileIcon> {
  final ListItem listItem;

  FileIconState(this.listItem);

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.all(10),
        child: SizedBox(
            width: 125,
            height: 125,
            child: GestureDetector(
              onTap: () => print('Tap!'),
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
