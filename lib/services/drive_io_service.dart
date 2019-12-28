import 'dart:async';

import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload/list_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload/remove_request.dart';
import 'package:sheety_gui/services/payload/remove_status_response.dart';
import 'package:sheety_gui/services/payload/upload_request.dart';
import 'package:sheety_gui/services/payload/upload_status_response.dart';

class DriveIOService {
  final _conn = locator<JavaConnectorService>();

  Future<List<ListItem>> listFiles({String query = ''}) {
    var completer = Completer<List<ListItem>>();

    _conn.sendRequest(
      payload: ListRequest(query),
      response: (ListResponse response) {
        completer.complete(response.items);
      },
      error: completer.completeError,
    );

    return completer.future;
  }

  /// Uploads the given files. [statusCallback] is a function with the
  /// parameters of the index of the file's upload status, total upload
  /// percentage of completion, and the raw [UploadStatusResponse].
  /// [startUpload] is invoked when a file is send initially to upload.
  /// TODO: Add options for upload type/compression
  void uploadFiles(List<String> files,
      {Function(int index, double progress, UploadStatusResponse response)
          statusCallback,
      Function(String) startUpload,
      Function() completeUpload}) {
    final double total = files.length.toDouble();
    double totalProgress = 0;

    files.asMap().forEach((index, file) {
      startUpload?.call(file);
      _conn.sendRequest(
        payload: UploadRequest(file, "multipart", "zip"),
        statusResponse: (UploadStatusResponse status) {
          var thisPercentage = status.percentage;
          var totalPercentage = (thisPercentage + totalProgress) / total;

          statusCallback?.call(index, totalPercentage, status);

          if (thisPercentage == 1) {
            totalProgress++;
            if (totalProgress == total) {
              completeUpload?.call();
            }
          }
        },
      );
    });
  }

  void removeFiles(List<String> ids,
      {Function(int index, double progress, RemoveStatusResponse response)
          statusCallback,
      Function(String) startRemove,
        Function() completeRemove}) {
    final double total = ids.length.toDouble();
    double totalProgress = 0;

    ids.asMap().forEach((index, id) {
      startRemove?.call(id);
      _conn.sendRequest(
        payload: RemoveRequest(id),
        statusResponse: (RemoveStatusResponse status) {
          var thisPercentage = status.percentage;
          var totalPercentage = (thisPercentage + totalProgress) / total;

          statusCallback?.call(index, totalPercentage, status);

          if (thisPercentage == 1) {
            totalProgress++;
            if (totalProgress == total) {
              completeRemove?.call();
            }
          }
        },
      );
    });
  }
}
