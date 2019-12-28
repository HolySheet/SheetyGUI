import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [UploadRequest](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#UploadRequest-3)
class UploadRequest extends BasicPayload {
  final String file;
  final String upload;
  final String compression;

  UploadRequest(this.file, this.upload, this.compression,
      [String message = 'Success'])
      : super(1, PayloadType.UPLOAD_REQUEST, message);

  UploadRequest.fromJson(Map<String, dynamic> json)
      : file = json['file'],
        upload = json['upload'],
        compression = json['compression'],
        super.fromJson(json, type: PayloadType.UPLOAD_REQUEST);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({'file': file, 'upload': upload, 'compression': compression});

  @override
  String toString() {
    return 'UploadRequest{code: $code, type: $type, message: $message, state: $state, file: $file, upload: $upload, compression: $compression}';
  }
}
