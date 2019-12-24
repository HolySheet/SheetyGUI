import 'dart:convert';

import 'package:sheety_gui/services/payload/download_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload/remove_request.dart';
import 'package:sheety_gui/services/payload/upload_request.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 3,
  "message": "Success",
  "state": null,
  "file": "file:///c:/file.txt",
  "upload": "multipart",
  "compression": "zip"
}
''');

void main() {
  test('From JSON', () {
    var payload = UploadRequest.fromJson(expected);

    expect('file:///c:/file.txt', payload.file);
    expect('multipart', payload.upload);
    expect('zip', payload.compression);
  });

  test('To JSON', () {
    var payload = UploadRequest('file:///c:/file.txt', 'multipart', 'zip');

    expect(expected, payload.toJson());
  });
}
