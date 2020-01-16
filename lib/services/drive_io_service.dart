import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:sheety_gui/generated/holysheet_service.pb.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/grpc_client_service.dart';
import 'package:sheety_gui/services/java_connector_service.dart';
import 'package:sheety_gui/services/settings_service.dart';

class DriveIOService {
  final _conn = locator<GRPCClientService>();
  final _settings = locator<SettingsService>();
  List<ListItem> cachedItems;

  Future<List<ListItem>> listFiles({String path = '', bool cache = true}) {
    if (cache && cachedItems != null) {
      return Future.value(List.of(cachedItems));
    }

    return _conn.client
        .listFiles(ListRequest()..path = path)
        .then((response) => List.of(cachedItems = response.items));
  }

  /// Uploads the given files. [statusCallback] is a function with the
  /// parameters of the index of the file's upload status, total upload
  /// percentage of completion, and the raw [UploadStatusResponse].
  /// [startUpload] is invoked when a file is send initially to upload.
  /// [completeUpload] is invoked when a single file has been uploaded.
  /// TODO: Add options for upload type/compression
  void uploadFiles(List<String> files,
          {Function(int index, double progress, UploadResponse response)
              statusCallback,
          Function(String) startUpload,
          Function() completeUpload}) =>
      _sendRequestForIds(
        files,
        sendRequest: (file) => _conn.client.uploadFile(UploadRequest()
          ..upload = _settings[Setting.upload]
          ..compression = _settings[Setting.compression]
          ..sheetSize = _settings[Setting.sheetSize]
          ..file = file),
        statusCallback: statusCallback,
        startAction: startUpload,
        completeAction: completeUpload,
      );

  /// Removes the given files. [statusCallback] is a function with the
  /// parameters of the index of the file's removal status, total removal
  /// percentage of completion, and the raw [RemoveStatusResponse].
  /// [startRemove] is invoked when a file is send initially to upload.
  /// [completeRemove] is invoked when a single file has been removed.
  void removeFiles(List<String> ids,
      {Function(int index, double progress, RemoveResponse response)
          statusCallback,
      Function(String) startRemove,
      Function() completeRemove}) {
    _sendRequestForIds(
      ids,
      sendRequest: (id) => _conn.client.removeFile(RemoveRequest()..id = id),
      statusCallback: statusCallback,
      startAction: startRemove,
      completeAction: completeRemove,
    );
  }

  /// Downloads the given files. [idPaths] is a map of IDs to paths to download
  /// the file to. [statusCallback] is a function with the
  /// parameters of the index of the file's download status, total download
  /// percentage of completion, and the raw [DownloadStatusResponse].
  /// [startDownload] is invoked when a file is send initially to download.
  /// [completeDownload] is invoked when a single file has been downloaded.
  void downloadFiles(Map<String, String> idPaths,
          {Function(int index, double progress, DownloadResponse response)
              statusCallback,
          Function(String) startDownload,
          Function() completeDownload}) =>
      _sendRequestForIds(
        idPaths.keys.toList(),
        sendRequest: (id) => _conn.client.downloadFile(DownloadRequest()
          ..id = id
          ..path = idPaths[id]),
        statusCallback: statusCallback,
        startAction: startDownload,
        completeAction: completeDownload,
      );

  /// Clones a file with the remote ID of [id] to Google Sheets. [statusCallback] is a function with the
  /// parameters of the index of the file's upload status, total upload
  /// percentage of completion, and the raw [UploadResponse].
  /// [startUpload] is invoked when a file is send initially to upload.
  /// [completeUpload] is invoked when a single file has been uploaded.
  void insertFromDrive(String id,
          {Function(double progress, UploadResponse response) statusCallback,
          Function(String) startUpload,
          Function() completeUpload}) =>
      _sendRequestForIds(
        [id],
        sendRequest: (_) => _conn.client.uploadFile(UploadRequest()
          ..upload = _settings[Setting.upload]
          ..compression = _settings[Setting.compression]
          ..sheetSize = _settings[Setting.sheetSize]
          ..id = id),
        statusCallback: (_, progress, response) =>
            statusCallback(progress, response),
        startAction: startUpload,
        completeAction: completeUpload,
      );

  void _sendRequestForIds<T>(List<String> ids,
      {@required ResponseStream<dynamic> Function(String) sendRequest,
      @required Function(int index, double progress, T response) statusCallback,
      @required Function(String) startAction,
      @required Function() completeAction}) {
    final double total = ids.length.toDouble();
    double totalProgress = 0;

    ids.asMap().forEach((index, id) {
      startAction?.call(id);

      sendRequest(id).listen((response) {
        var thisPercentage = response.percentage;
        var totalPercentage = (thisPercentage + totalProgress) / total;

        statusCallback?.call(index, totalPercentage, response);

        if (thisPercentage == 1) {
          totalProgress++;
          if (totalProgress == total) {
            completeAction?.call();
          }
        }
      });
    });
  }
}
