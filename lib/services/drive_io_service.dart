import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/download_request.dart';
import 'package:sheety_gui/services/payload/download_status_response.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload/list_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload/remove_request.dart';
import 'package:sheety_gui/services/payload/remove_status_response.dart';
import 'package:sheety_gui/services/payload/status_response.dart';
import 'package:sheety_gui/services/payload/upload_request.dart';
import 'package:sheety_gui/services/payload/upload_status_response.dart';

class DriveIOService {
  final _conn = locator<JavaConnectorService>();

  Future<List<ListItem>> listFiles({String query = ''}) {
    var completer = Completer<List<ListItem>>();

    _conn.sendRequest<ListResponse>(
      payload: ListRequest(query),
      response: (response) {
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
  /// [completeUpload] is invoked when a single file has been uploaded.
  /// TODO: Add options for upload type/compression
  void uploadFiles(List<String> files,
      {Function(int index, double progress, UploadStatusResponse response)
          statusCallback,
      Function(String) startUpload,
      Function() completeUpload}) {
//    final double total = files.length.toDouble();
//    double totalProgress = 0;
//
//    files.asMap().forEach((index, file) {
//      startUpload?.call(file);
//      _conn.sendRequest(
//        payload: UploadRequest(file, "multipart", "zip"),
//        statusResponse: (UploadStatusResponse status) {
//          var thisPercentage = status.percentage;
//          var totalPercentage = (thisPercentage + totalProgress) / total;
//
//          statusCallback?.call(index, totalPercentage, status);
//
//          if (thisPercentage == 1) {
//            totalProgress++;
//            if (totalProgress == total) {
//              completeUpload?.call();
//            }
//          }
//        },
//      );
//    });

    _sendRequestForIds(
      files,
      createRequest: (file) => UploadRequest(file, 'multipart', 'zip'),
      statusCallback: statusCallback,
      startAction: startUpload,
      completeAction: completeUpload,
    );
  }

  /// Removes the given files. [statusCallback] is a function with the
  /// parameters of the index of the file's removal status, total upload
  /// percentage of completion, and the raw [RemoveStatusResponse].
  /// [startRemove] is invoked when a file is send initially to upload.
  /// [completeRemove] is invoked when a single file has been removed.
  void removeFiles(List<String> ids,
      {Function(int index, double progress, RemoveStatusResponse response)
          statusCallback,
      Function(String) startRemove,
      Function() completeRemove}) {
//    final double total = ids.length.toDouble();
//    double totalProgress = 0;
//
//    ids.asMap().forEach((index, id) {
//      startRemove?.call(id);
//      _conn.sendRequest(
//        payload: RemoveRequest(id),
//        statusResponse: (RemoveStatusResponse status) {
//          var thisPercentage = status.percentage;
//          var totalPercentage = (thisPercentage + totalProgress) / total;
//
//          statusCallback?.call(index, totalPercentage, status);
//
//          if (thisPercentage == 1) {
//            totalProgress++;
//            if (totalProgress == total) {
//              completeRemove?.call();
//            }
//          }
//        },
//      );
//    });

    _sendRequestForIds(
      ids,
      createRequest: (id) => RemoveRequest(id),
      statusCallback: statusCallback,
      startAction: startRemove,
      completeAction: completeRemove,
    );
  }

  void downloadFiles(List<String> ids,
      {Function(int index, double progress, DownloadStatusResponse response)
          statusCallback,
      Function(String) startDownload,
      Function() completeDownload}) {
//    final double total = ids.length.toDouble();
//    double totalProgress = 0;
//
//    ids.asMap().forEach((index, id) {
//      startDownload?.call(id);
//      _conn.sendRequest(
//        payload: DownloadRequest(id),
//        statusResponse: (DownloadStatusResponse status) {
//          var thisPercentage = status.percentage;
//          var totalPercentage = (thisPercentage + totalProgress) / total;
//
//          statusCallback?.call(index, totalPercentage, status);
//
//          if (thisPercentage == 1) {
//            totalProgress++;
//            if (totalProgress == total) {
//              completeDownload?.call();
//            }
//          }
//        },
//      );
//    });

    _sendRequestForIds(
      ids,
      createRequest: (id) => DownloadRequest(id),
      statusCallback: statusCallback,
      startAction: startDownload,
      completeAction: completeDownload,
    );
  }

  void _sendRequestForIds<T extends StatusResponse>(List<String> ids,
      {@required BasicPayload Function(String id) createRequest,
      @required Function(int index, double progress, T response) statusCallback,
      @required Function(String) startAction,
      @required Function() completeAction}) {
    final double total = ids.length.toDouble();
    double totalProgress = 0;

    ids.asMap().forEach((index, id) {
      startAction?.call(id);
      _conn.sendRequest<T>(
        payload: createRequest(id),
        statusResponse: (status) {
          var thisPercentage = status.percentage;
          var totalPercentage = (thisPercentage + totalProgress) / total;

          statusCallback?.call(index, totalPercentage, status);

          if (thisPercentage == 1) {
            totalProgress++;
            if (totalProgress == total) {
              completeAction?.call();
            }
          }
        },
      );
    });
  }
}
