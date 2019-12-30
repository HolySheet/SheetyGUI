import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [DownloadRequest](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#DownloadRequest-5)
class DownloadRequest extends BasicPayload {
  final String id;
  final String path;

  DownloadRequest(this.id, this.path, [String message = 'Success'])
      : super(1, PayloadType.DOWNLOAD_REQUEST, message);

  DownloadRequest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        path = json['path'],
        super.fromJson(json, type: PayloadType.DOWNLOAD_REQUEST);

  Map<String, dynamic> toJson() => super.toJson()..addAll({'id': id, 'path': path});

  @override
  String toString() {
    return 'DownloadRequest{code: $code, type: $type, message: $message, state: $state, id: $id, path: $path}';
  }
}
