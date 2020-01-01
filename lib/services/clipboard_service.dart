import 'dart:async';

import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/code_execution_request.dart';
import 'package:sheety_gui/services/payload/code_execution_response.dart';

class ClipboardService {
  final _conn = locator<JavaConnectorService>();

  Future<String> getClipboard() {
    final completer = Completer<String>();

    _conn.sendRequest(
      payload: CodeExecutionRequest(
          'Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);'),
      response: (CodeExecutionResponse response) => completer.complete(response.variables.first.object),
      error: completer.completeError,
    );

    return completer.future;
  }
}
