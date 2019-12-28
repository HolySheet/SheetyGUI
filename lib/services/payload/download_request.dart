import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [DownloadRequest](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#DownloadRequest-5)
class DownloadRequest extends BasicPayload {
  final String id;

  DownloadRequest(this.id, [String message = 'Success'])
      : super(1, PayloadType.DOWNLOAD_REQUEST, message);

  DownloadRequest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        super.fromJson(json, type: PayloadType.DOWNLOAD_REQUEST);

  Map<String, dynamic> toJson() => super.toJson()..addAll({'id': id});

  @override
  String toString() {
    return 'DownloadRequest{code: $code, type: $type, message: $message, state: $state, id: $id}';
  }
}
