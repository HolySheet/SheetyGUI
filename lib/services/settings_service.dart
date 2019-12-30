import 'dart:convert';
import 'dart:io';

class SettingsService {
  static String get userHome =>
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  File settingsFile;

  Future<void> init() {
    settingsFile = File('$userHome/.holysheet');
    print('Settings located at $settingsFile');

    return settingsFile
        .exists()
        .then((exists) => exists ? loadSettings() : saveSettings())
        .then((_) => print('Finished loading settings'))
        .then((_) => print('Downbloads is: ${Setting.downloadDirectory.value}'));
  }

  void setSetting<T>(Setting<T> setting, T value) {
    setting.value = value;
    saveSettings();
  }

  T getSetting<T>(Setting<T> setting) => setting.value;

  Future<void> saveSettings() =>
      settingsFile.writeAsString(jsonEncode(Setting.toJson()));

  Future<void> loadSettings() => settingsFile
      .readAsString()
      .then((json) => Setting.fromJson(jsonDecode(json)));
}

class Setting<T> {
  static final Setting<File> downloadDirectory = Setting(
      'downloadDirectory', File('${SettingsService.userHome}\\Downloads'));
  static final Setting<String> compression = Setting('compression', 'zip');
  static final Setting<String> upload = Setting('upload', 'multipart');

  static final List<Setting> values = [];

  final String name;
  final T def;
  T value;

  Setting(this.name, this.def) : value = def {
    values.add(this);
  }

  static Setting fromName(String name) =>
      values.firstWhere((setting) => setting.name == name);

  static void fromJson(Map<String, dynamic> json) =>
      json.forEach((key, value) => fromName(key)?.value = value);

  static Map<String, dynamic> toJson() => Map.fromIterable(values,
      key: (setting) => setting.name, value: (setting) => setting.value);
}
