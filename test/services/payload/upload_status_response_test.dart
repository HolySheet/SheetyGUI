import 'dart:convert';

import 'package:sheety_gui/services/payload/remove_status_response.dart';
import 'package:sheety_gui/services/payload/upload_status_response.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 4,
  "message": "Success",
  "state": null,
  "status": "UPLOADING",
  "percentage": 0.856
}
''');

void main() {
  test('From JSON', () {
    var payload = UploadStatusResponse.fromJson(expected);

    expect('UPLOADING', payload.status);
    expect(0.856, payload.percentage);
  });

  test('To JSON', () {
    var payload = UploadStatusResponse('UPLOADING', 0.856);

    expect(expected, payload.toJson());
  });
}
