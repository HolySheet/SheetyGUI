import 'dart:convert';

import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = json.decode(
'''
{
  "code": 1,
  "type": 1,
  "message": "Success"
}
''');

void main() {
  test('JSON should be serialized to an expected value', () {
    var payload = BasicPayload.fromJson(expected);

    expect(1, payload.code);
    expect(PayloadType.LIST, payload.type);
    expect('Success', payload.message);
  });

  test('JSON should be deserialized to an expected value', () {
    var payload = BasicPayload(1, PayloadType.LIST, 'Success');

    expect(expected, payload.toJson());
  });
}
