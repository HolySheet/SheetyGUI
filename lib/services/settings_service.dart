import 'dart:convert';
import 'dart:io';

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

  void setSetting<T>(Setting<T> setting, T value) {
    setting.value = value;
    saveSettings();
  }

  T getSetting<T>(Setting<T> setting) => setting.value;

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
}

class Setting<T> {
  static final Setting<File> downloadDirectory = Setting(
      'downloadDirectory', File('${SettingsService.userHome}\\Downloads'));

  static final Setting<String> compression =
      Setting('compression', Compression.zip, Compression.values);

  static final Setting<String> upload =
      Setting('upload', Upload.multipart, Upload.values);

  static final List<Setting> values = [];

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

  Setting(this.name, this.def, [this.allowed = const []]) : _value = def {
    values.add(this);
  }

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
    } else {
      print('Unknown setting type: $setting');
    }
  }
}

class Compression {
  static final String none = 'none';
  static final String zip = 'zip'; // default

  static final List<String> values = [none, zip];
}

class Upload {
  static final String multipart = 'multipart'; // default
  static final String direct = 'direct';

  static final List<String> values = [multipart, direct];
}
