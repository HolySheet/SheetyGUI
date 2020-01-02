import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [UploadRequest](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#UploadRequest-3)
class UploadRequest extends BasicPayload {
  final String file;
  final String id;
  final String upload;
  final String compression;
  final int sheetSize;

  UploadRequest(this.upload, this.compression, this.sheetSize, {this.file, this.id, String message = 'Success'})
      : super(1, PayloadType.UPLOAD_REQUEST, message);

  UploadRequest.fromJson(Map<String, dynamic> json)
      : file = json['file'],
        id = json['id'],
        upload = json['upload'],
        compression = json['compression'],
        sheetSize = json['sheetSize'],
        super.fromJson(json, type: PayloadType.UPLOAD_REQUEST);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({'file': file, 'id': id, 'upload': upload, 'compression': compression, 'sheetSize': sheetSize});

  @override
  String toString() {
    return 'UploadRequest{code: $code, type: $type, message: $message, state: $state, file: $file, id: $id, upload: $upload, compression: $compression, sheetSize: $sheetSize}';
  }
}
