import 'package:get_it/get_it.dart';
import 'package:sheety_gui/scoped_model/list_model.dart';
import 'package:sheety_gui/scoped_model/settings_model.dart';
import 'package:sheety_gui/services/clipboard_service.dart';
import 'package:sheety_gui/services/drive_io_service.dart';
import 'package:sheety_gui/services/file_selection_service.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/settings_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<JavaConnectorService>(() => JavaConnectorService());
  locator.registerLazySingleton<FileSelectionService>(() => FileSelectionService());
  locator.registerLazySingleton<DriveIOService>(() => DriveIOService());
  locator.registerLazySingleton<SettingsService>(() => SettingsService());
  locator.registerLazySingleton<ClipboardService>(() => ClipboardService());

  locator.registerFactory<ListModel>(() => ListModel());
  locator.registerFactory<SettingsModel>(() => SettingsModel());
}
