import 'package:get_it/get_it.dart';
import 'package:sheety_gui/scoped_model/list_model.dart';
import 'package:sheety_gui/services/file_selection_service.dart';
import 'package:sheety_gui/services/java_connector_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<JavaConnectorService>(() => JavaConnectorService());
  locator.registerLazySingleton<FileSelectionService>(() => FileSelectionService());

  locator.registerFactory<ListModel>(() => ListModel());
}
