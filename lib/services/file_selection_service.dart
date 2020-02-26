import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:sheety_gui/generated/sheety_gui_service.pb.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/grpc_client_service.dart';

import '../utility.dart';

class FileSelectionService {
  final _conn = locator<GRPCClientService>();

  void sendRequest(
      {@required Function(List<File>) onSelect,
      Function() onCancel,
      bool multi = false,
      String title = 'File chooser',
      String initialDirectory = '',
      SelectorRequest_SelectionMode mode = SelectorRequest_SelectionMode.Open,
      SelectorRequest_FileSelection selectionMode =
          SelectorRequest_FileSelection.Files}) {
    _conn.sheetyClient
        .openFileSelector(SelectorRequest()
          ..title = title
          ..multiSelect = multi
          ..initialDirectory = initialDirectory
          ..mode = mode
          ..selectionMode = selectionMode)
        .printErrors()
        .then((response) {
      if (response.cancelled) {
        onCancel?.call();
        return;
      }

      onSelect(response.files.map((path) => File(path)).toList());
    });
  }
}
