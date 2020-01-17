import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:sheety_gui/generated/holysheet_service.pb.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/grpc_client_service.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:uuid/uuid.dart';

final Uuid _uuid = Uuid();

class FileSelectionService {
  final _conn = locator<GRPCClientService>();

  void sendRequest(
      {@required Function(List<File>) selected,
      Function() cancelled,
      bool multi = false,
      String title = 'File chooser',
      String initialDirectory = '',
      SelectionMode mode = SelectionMode.open,
      FileSelection selectionMode = FileSelection.files}) {
    if (initialDirectory.isNotEmpty) {
      initialDirectory = '"$initialDirectory"';
    }

    var selectedUuid = _uuid.v4();
    var cancelUuid = _uuid.v4();

    _conn
      ..addCallbacks({ // E:\RubbaBot2
        selectedUuid: (response) {
          print('got response!');
          var sel = List<String>.from(jsonDecode(response.variables.first.object))
              .map((path) => File(path))
              .toList();
          print('sel = $sel');
          selected(sel);
          return true;
        },
        cancelUuid: (response) => cancelled?.call()
      })
      ..client
          .executeCode(CodeExecutionRequest()
            ..code = """
      CompletableFuture.runAsync(() -> {
          try {
              UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
          } catch (Exception ignored) {}
      
          var chooser = new JFileChooser($initialDirectory);
          chooser.setMultiSelectionEnabled($multi);
          chooser.setDialogTitle("$title");
          chooser.setFileSelectionMode(${selectionMode.index});
          var result = chooser.${mode.method}(new JFrame());
          if (result == 0) {
              var selected = Stream.of(chooser.isMultiSelectionEnabled() ? chooser.getSelectedFiles() : new File[]{chooser.getSelectedFile()})
                      .map(File::getAbsolutePath)
                      .collect(Collectors.toUnmodifiableList());
      
              // callback $selectedUuid selected
          } else {
              // callback $cancelUuid
          }
      });
      """)
          .then((_) => print('Opened file picker'), onError: (e) {
        print('Error: $e');
        cancelled?.call();
      });
  }
}

class SelectionMode {
  static const SelectionMode open = SelectionMode('showOpenDialog');
  static const SelectionMode save = SelectionMode('showSaveDialog');

  final String method;

  const SelectionMode(this.method);
}

enum FileSelection {
  files, // JFileChooser.FILES_ONLY = 0
  directories, // JFileChooser.DIRECTORIES_ONLY = 1
  all, // JFileChooser.FILES_AND_DIRECTORIES = 2
}
