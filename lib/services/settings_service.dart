import 'dart:convert';
import 'dart:io';

import 'package:protobuf/protobuf.dart';
import 'package:sheety_gui/generated/holysheet_service.pb.dart';
import 'package:sheety_gui/utility.dart';

class SettingsService {
  static String get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  File settingsFile = '$userHome/.holysheet'.file();

  Future<void> init() {
    print('Settings located at $settingsFile');

    return settingsFile
        .exists()
        .then((exists) => exists ? loadSettings() : saveSettings())
        .then((_) => print('Finished loading settings'));
  }

  Future<void> saveSettings() =>
      settingsFile.writeAsString(jsonEncode(Setting.toJson()));

  Future<void> loadSettings() {
    return settingsFile.readAsString().then((json) {
      try {
        Setting.fromJson(jsonDecode(json));
      } catch (e) {
        print(e);
      }
    });
  }

  void setSetting<T>(Setting<T> setting, T value) {
    setting.value = value;
    saveSettings();
  }

  T getSetting<T>(Setting<T> setting) => setting.value;

  operator [](Setting<dynamic> setting) => getSetting(setting);

  operator []=(Setting<dynamic> setting, dynamic value) =>
      setSetting(setting, value);
}

class Setting<T> {
  static final Setting<File> downloadDirectory = Setting(
      'downloadDirectory', File('${SettingsService.userHome}\\Downloads'));

  static final Setting<UploadRequest_Compression> compression =
      Setting('compression', UploadRequest_Compression.ZIP, UploadRequest_Compression.values);

  static final Setting<UploadRequest_Upload> upload =
      Setting('upload', UploadRequest_Upload.MULTIPART, UploadRequest_Upload.values);

  static final Setting<int> sheetSize = Setting('sheetSize', 10000000); // 10MB

  static final List<Setting> values = [
    downloadDirectory,
    compression,
    upload,
    sheetSize
  ];

  final String name;
  final T def;
  final List<T> allowed;

  T _value;

  T get value => _value;

  set value(value) {
    if (allowed.isNotEmpty && !allowed.contains(value)) {
      _value ??= def;
      return;
    }

    _value = value;
  }

  Setting(this.name, this.def, [this.allowed = const []]) : _value = def;

  static Setting<dynamic> fromName(String name) =>
      values.firstWhere((setting) => setting.name == name, orElse: () => null);

  static void fromJson(Map<String, dynamic> json) =>
      json.forEach(valueFromJson);

  static Map<String, dynamic> toJson() => Map.fromIterable(values,
      key: (setting) => setting.name, value: (setting) => valueToJson(setting));

  static dynamic valueToJson(Setting setting) {
    if (setting is Setting<File>) {
      return setting.value.path;
    } else if (setting is Setting<String>) {
      return setting.value;
    } else if (setting is Setting<int>) {
      return setting.value;
    } else if (setting is Setting<ProtobufEnum>) {
      return setting.value.value; // Gets ordinal of enum
    } else {
      print('Don\'t know what to do with: $setting');
      return null;
    }
  }

  static dynamic valueFromJson(String key, dynamic value) {
    final setting = fromName(key);
    if (setting == null) {
      print('Setting not found: $key');
      return;
    }

    if (setting is Setting<File>) {
      setting.value = File(value);
    } else if (setting is Setting<String>) {
      setting.value = value;
    } else if (setting is Setting<int>) {
      setting.value = value;
    } else if (setting is Setting<ProtobufEnum>) {
      setting.value = setting.allowed[value]; // From ordinal of enum
    } else {
      print('Unknown setting type: $setting');
    }
  }

  @override
  String toString() {
    return 'Setting{name: $name, def: $def}';
  }
}
