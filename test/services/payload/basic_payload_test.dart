import 'dart:convert';

import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode(
'''
{
  "code": 1,
  "type": 1,
  "message": "Success",
  "state": "0317d1f0-6053-4cce-89ba-9e896784820a"
}
''');

void main() {
  test('From JSON', () {
    var payload = BasicPayload.fromJson(expected);

    expect(payload.code, 1);
    expect(payload.type, PayloadType.LIST_REQUEST);
    expect(payload.message, 'Success');
    expect(payload.state, '0317d1f0-6053-4cce-89ba-9e896784820a');
  });

  test('To JSON', () {
    var payload = BasicPayload(1, PayloadType.LIST_REQUEST, 'Success', '0317d1f0-6053-4cce-89ba-9e896784820a');

    expect(payload.toJson(), expected);
  });
}
