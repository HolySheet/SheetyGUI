import 'dart:convert';

import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 2,
  "message": "Success",
  "state": null,
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
  test('From JSON', () {
    var payload = ListResponse.fromJson(expected);

    var first = payload.items.first;

    expect(first.name, 'test.txt');
    expect(first.size, 54321);
    expect(first.sheets, 6);
    expect(first.date, 123456789);
    expect(first.id, 'abcdefghijklmnopqrstuvwxyz');
  });

  test('To JSON', () {
    var payload = ListResponse([ListItem('test.txt', 54321, 6, 123456789, 'abcdefghijklmnopqrstuvwxyz')]);

    expect(payload.toJson(), expected);
  });
}
