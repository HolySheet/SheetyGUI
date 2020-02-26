import 'dart:async';

import 'package:sheety_gui/generated/sheety_gui_service.pb.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/grpc_client_service.dart';

class ClipboardService {
  final _conn = locator<GRPCClientService>();

  Future<String> getClipboard() => _conn.sheetyClient
      .getClipboard(ClipboardRequest())
      .then((response) => response.content);
}
