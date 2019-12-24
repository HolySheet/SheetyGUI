import 'dart:convert';

import 'package:sheety_gui/services/payload/download_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 5,
  "message": "Success",
  "state": null,
  "id": "1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq"
}
''');

void main() {
  test('From JSON', () {
    var payload = DownloadRequest.fromJson(expected);

    expect('1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq', payload.id);
  });

  test('To JSON', () {
    var payload = DownloadRequest('1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq');

    expect(expected, payload.toJson());
  });
}
