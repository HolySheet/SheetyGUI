import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:sheety_gui/generated/holysheet_service.pb.dart';
import 'package:sheety_gui/service_locator.dart';
import 'package:sheety_gui/services/grpc_client_service.dart';
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
        ?.listFiles(ListRequest()..path = path)
        ?.then((response) => List.of(cachedItems = response.items)) ?? [];
  }

  /// Uploads the given files. [statusCallback] is invoked
  /// with the 0-1 percentage of the total completion. [startUpload] is invoked
  /// when a file is about to be uploaded, and [completeUpload] is invoked
  /// when a file has been uploaded, with an argument of the file ID and the
  /// [ListItem] uploaded.
  Future<void> uploadFiles(List<String> files,
      {Function(double) statusCallback,
      Function(String) startUpload,
      Function(String, ListItem) completeUpload}) async {
    final double total = files.length.toDouble();
    for (var i = 0; i < files.length; i++) {
      startUpload(files[i]);
      final item = await waitForComplete(_conn.client.uploadFile(UploadRequest()
        ..upload = _settings[Setting.upload]
        ..compression = _settings[Setting.compression]
        ..sheetSize = Int64(_settings[Setting.sheetSize])
        ..localPath = files[i]));

      completeUpload(files[i], item);
      statusCallback((i + 1) / total);
    }
  }

  Future<ListItem> waitForComplete(
      ResponseStream<UploadResponse> response) async {
    final completer = Completer<ListItem>();
    response.listen((response) {
      if (response.uploadStatus == UploadResponse_UploadStatus.COMPLETE) {
        completer.complete(response.item);
      }
    });
    return completer.future;
  }

  /// Removes the given files with IDs of [ids]. [statusCallback] is invoked
  /// with the 0-1 percentage of the total completion. [startRemove] is invoked
  /// when a file is about to be deleted, and [completeRemove] is invoked
  /// when a file has been removed.
  Future<void> removeFiles(List<String> ids,
      {Function(double) statusCallback,
      Function(String) startRemove,
      Function(String) completeRemove}) async {
    final double total = ids.length.toDouble();
    for (var i = 0; i < ids.length; i++) {
      startRemove(ids[i]);
      await _conn.client.removeFile(RemoveRequest()..id = ids[i]);
      completeRemove(ids[i]);
      statusCallback((i + 1) / total);
    }
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

  /// Clones a file with the remote ID of [id] to Google Sheets. Returns the
  /// created [ListItem] file.
  Future<ListItem> insertFromDrive(String id) async =>
      waitForComplete(_conn.client.uploadFile(UploadRequest()
        ..id = id
        ..upload = _settings[Setting.upload]
        ..compression = _settings[Setting.compression]
        ..sheetSize = Int64(_settings[Setting.sheetSize])));

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
