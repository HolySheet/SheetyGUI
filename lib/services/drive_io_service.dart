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
import 'package:sheety_gui/services/settings_service.dart';

class DriveIOService {
  final _conn = locator<JavaConnectorService>();
  final _settings = locator<SettingsService>();

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
          Function() completeUpload}) => _sendRequestForIds(
        files,
        createRequest: (file) => UploadRequest(_settings[Setting.upload], _settings[Setting.compression], _settings[Setting.sheetSize], file: file),
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
          {Function(int index, double progress, RemoveStatusResponse response)
              statusCallback,
          Function(String) startRemove,
          Function() completeRemove}) =>
      _sendRequestForIds(
        ids,
        createRequest: (id) => RemoveRequest(id),
        statusCallback: statusCallback,
        startAction: startRemove,
        completeAction: completeRemove,
      );

  /// Downloads the given files. [idPaths] is a map of IDs to paths to download
  /// the file to.[statusCallback] is a function with the
  /// parameters of the index of the file's download status, total download
  /// percentage of completion, and the raw [DownloadStatusResponse].
  /// [startDownload] is invoked when a file is send initially to upload.
  /// [completeDownload] is invoked when a single file has been downloaded.
  void downloadFiles(Map<String, String> idPaths,
          {Function(int index, double progress, DownloadStatusResponse response)
              statusCallback,
          Function(String) startDownload,
          Function() completeDownload}) =>
      _sendRequestForIds(
        idPaths.keys.toList(),
        createRequest: (id) => DownloadRequest(id, idPaths[id]),
        statusCallback: statusCallback,
        startAction: startDownload,
        completeAction: completeDownload,
      );

  void insertFromDrive(String id,
          {Function(double progress, UploadStatusResponse response)
              statusCallback,
          Function(String) startUpload,
          Function() completeUpload}) => _sendRequestForIds(
        [id],
        createRequest: (_) => UploadRequest(_settings[Setting.upload], _settings[Setting.compression], _settings[Setting.sheetSize], id: id),
        statusCallback: (_, progress, response) => statusCallback(progress, response),
        startAction: startUpload,
        completeAction: completeUpload,
      );

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
