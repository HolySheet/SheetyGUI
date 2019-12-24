import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/list_response.dart';

class ListModel extends BaseModel {
  final _conn = locator<JavaConnectorService>();

  List<ListItem> listItems = [];

  void click() {
    print('Click!');

    _conn.connect();
  }

  void refreshFiles() {
    print('Refreshing files!');

    _conn.send().then((response) => listItems = response.items).whenComplete(notifyListeners);
  }
}