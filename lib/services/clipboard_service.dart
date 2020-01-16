import 'dart:async';

import 'package:sheety_gui/generated/holysheet_service.pb.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/grpc_client_service.dart';

class ClipboardService {
  final _conn = locator<GRPCClientService>();

  Future<String> getClipboard() => _conn.client
      .executeCode(CodeExecutionRequest()
        ..code =
            'Toolkit.getDefaultToolkit().getSystemClipboard().getData(DataFlavor.stringFlavor);')
      .then((response) => response.variables.first.object);
}
