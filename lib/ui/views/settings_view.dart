import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:sheety_gui/scoped_model/settings_model.dart';
import 'package:sheety_gui/services/settings_service.dart';
import 'package:sheety_gui/ui/views/base_view.dart';

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  static const int MB = 1000000;

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsModel>(
        topButtons: [
          TopButton(context, 'Back', Icons.arrow_back, route: '/'),
        ],
        scaffoldKey: GlobalKey<ScaffoldState>(),
        builder: (context, child, model) => Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('Settings',
                      style: Theme.of(context).textTheme.display1),
                  SizedBox(height: 10),
                  getFileOption(
                      model, 'Download Directory', Setting.downloadDirectory),
                  getMultiOption(model, 'Compression', Setting.compression),
                  getMultiOption(model, 'Upload Type', Setting.upload),
                  getMegabyteOption(model, 'Sheet Size', Setting.sheetSize),
                ],
              ),
            ));
  }

  Widget getToggleOption(
          SettingsModel model, String text, Setting<bool> setting) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text),
          SizedBox(width: 30),
          GestureDetector(
            onTap: () => model.toggleSetting(setting),
            child: Switch(
              value: model.getSetting(setting),
              onChanged: (value) => model.toggleSetting(setting),
            ),
          ),
        ],
      );

  Widget getMultiOption(
          SettingsModel model, String text, Setting<ProtobufEnum> setting) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text),
          SizedBox(width: 30),
          DropdownButton<ProtobufEnum>(
            value: model.getSetting(setting),
            underline: Container(
              height: 2,
              color: Color(0xFFC1C1C1),
            ),
            items: setting.allowed
                .map((value) => DropdownMenuItem<ProtobufEnum>(
                      value: value,
                      child: Text(camelCase(value.name)),
                    ))
                .toList(),
            onChanged: (value) => model.changeDropdown(setting, value),
          ),
        ],
      );

  Widget getFileOption(
          SettingsModel model, String text, Setting<File> setting) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text),
          SizedBox(width: 30),
          Expanded(
            child: TextField(
              controller: model.getFileInputController(setting),
              onSubmitted: (value) => model.changedFile(setting, value),
            ),
          ),
          IconButton(
            icon: Icon(Icons.insert_drive_file),
            onPressed: () => model.openFolderSelection(setting),
          ),
        ],
      );

  Widget getMegabyteOption(
          SettingsModel model, String text, Setting<int> setting) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text),
          SizedBox(width: 30),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 100),
            child: TextField(
              decoration: InputDecoration(suffixText: 'MB'),
              keyboardType: TextInputType.number,
              controller: model.getSizeInputController(setting),
              onSubmitted: (value) => model.changeSize(setting, value),
            ),
          ),
        ],
      );

  String camelCase(String input) {
    var split = input.toLowerCase().split('_');
    var first = split.first;
    split[0] = '${first.substring(0, 1).toUpperCase()}${first.substring(1, first.length)}';
    return split.join(' ');
  }
}
