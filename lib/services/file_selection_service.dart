import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/code_execution_request.dart';
import 'package:uuid/uuid.dart';

final Uuid _uuid = Uuid();

class FileSelectionService {
  final _conn = locator<JavaConnectorService>();

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
    _conn.sendRequest(
        payload: CodeExecutionRequest("""
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
      """),
        response: (_) => print('Opened file picker'),
        error: (e) {
          print('Error:\n${e.message}\n${e.stacktrace}');
          cancelled?.call();
        },
        callback: {
          selectedUuid: (response) => selected(
              List<String>.from(response.variables.first.object)
                  .map((path) => File(path))
                  .toList()),
          cancelUuid: (response) => cancelled?.call()
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
  files,       // JFileChooser.FILES_ONLY = 0
  directories, // JFileChooser.DIRECTORIES_ONLY = 1
  all,         // JFileChooser.FILES_AND_DIRECTORIES = 2
}
