import 'dart:convert';

import 'package:sheety_gui/services/payload/download_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload/remove_request.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 7,
  "message": "Success",
  "state": null,
  "id": "1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq"
}
''');

void main() {
  test('From JSON', () {
    var payload = RemoveRequest.fromJson(expected);

    expect(payload.id, '1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq');
  });

  test('To JSON', () {
    var payload = RemoveRequest('1KLruEf0d8GJgf7JGaYUiNnW_Pe0Zumvq');

    expect(payload.toJson(), expected);
  });
}
