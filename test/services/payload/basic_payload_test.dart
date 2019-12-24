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

    expect(1, payload.code);
    expect(PayloadType.LIST_REQUEST, payload.type);
    expect('Success', payload.message);
    expect('0317d1f0-6053-4cce-89ba-9e896784820a', payload.state);
  });

  test('To JSON', () {
    var payload = BasicPayload(1, PayloadType.LIST_REQUEST, 'Success', '0317d1f0-6053-4cce-89ba-9e896784820a');

    expect(expected, payload.toJson());
  });
}
