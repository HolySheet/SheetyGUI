import 'package:sheety_gui/scoped_model/base_model.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';

class ListModel extends BaseModel {
  final _conn = locator<JavaConnectorService>();

  void click() {
    print('Click!');

    _conn.connect();
  }

  void sssss() {
    print('Send!');

    _conn.send();
  }
}