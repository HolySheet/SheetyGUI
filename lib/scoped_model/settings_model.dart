import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:filesize/filesize.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/drive_io_service.dart';
import 'package:sheety_gui/services/file_selection_service.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/settings_service.dart';
import 'package:sheety_gui/utility.dart';

class SettingsModel extends BaseModel {
  static const int MB = 1000000;

  final _settings = locator<SettingsService>();
  final _selection = locator<FileSelectionService>();
  final _settingControllers = Map<Setting, TextEditingController>();

  T getSetting<T>(Setting<T> setting) => _settings.getSetting(setting);

  void toggleSetting(Setting<bool> setting) {
    _settings.setSetting(setting, getSetting(setting));
    notifyListeners();
  }

  void changeDropdown(Setting<String> setting, String value) {
    _settings.setSetting(setting, value);
    notifyListeners();
  }

  TextEditingController getFileInputController(Setting<File> setting) =>
      _settingControllers.putIfAbsent(
          setting, () => TextEditingController(text: getSetting(setting).path));

  TextEditingController getSizeInputController(Setting<int> setting) =>
      _settingControllers.putIfAbsent(
          setting, () => TextEditingController(text: '${getSetting(setting) / MB}'));

  void openFolderSelection(Setting<File> setting) {
    _selection.sendRequest(
        title: 'Select downloads directory',
        initialDirectory: getSetting(setting)?.path ?? '',
        selectionMode: FileSelection.directories,
        selected: (file) {
          var first = file.first;
          getFileInputController(setting).text = first.path;
          _settings.setSetting(setting, first);
        });
  }

  void changedFile(Setting<File> setting, String value) {
    getFileInputController(setting).text = value;
    _settings.setSetting(setting, File(value));
  }

  void changeSize(Setting<int> setting, String value) {
    final num = int.parse(value) * MB;
    _settings.setSetting(setting, num);
  }
}
