import 'dart:convert';

import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = json.decode('''
{
  "code": 1,
  "type": 1,
  "message": "Success",
  "items": [
    {
      "name": "test.txt",
      "size": 54321,
      "sheets": 6,
      "date": 123456789,
      "id": "abcdefghijklmnopqrstuvwxyz"
    }
  ]
}
''');

void main() {
  test('JSON should be serialized to an expected value', () {
    var payload = ListResponse.fromJson(expected);

    var first = payload.items.first;

    expect('test.txt', first.name);
    expect(54321, first.size);
    expect(6, first.sheets);
    expect(123456789, first.date);
    expect('abcdefghijklmnopqrstuvwxyz', first.id);
  });

  test('JSON should be deserialized to an expected value', () {
    var payload = ListResponse([ListItem('test.txt', 54321, 6, 123456789, 'abcdefghijklmnopqrstuvwxyz')], 1, PayloadType.LIST, 'Success');

    expect(expected, payload.toJson());
  });
}
