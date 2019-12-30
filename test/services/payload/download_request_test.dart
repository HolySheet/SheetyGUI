import 'dart:convert';

import 'package:sheety_gui/services/payload/download_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode(r'''
{
  "code": 1,
  "type": 5,
  "message": "Success",
  "state": null,
  "id": "1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq",
  "path": "E:\\file.mp4"
}
''');

void main() {
  test('From JSON', () {
    var payload = DownloadRequest.fromJson(expected);

    expect(payload.id, '1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq');
    expect(payload.path, 'E:\\file.mp4');
  });

  test('To JSON', () {
    var payload = DownloadRequest('1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq', 'E:\\file.mp4');

    expect(payload.toJson(), expected);
  });
}
