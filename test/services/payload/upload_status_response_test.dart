import 'dart:convert';

import 'package:sheety_gui/services/payload/list_item.dart';
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
  "percentage": 0.856,
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

// Technically the `items` list should be empty as the status is not COMPLETE,
// but whatever.
void main() {
  test('From JSON', () {
    var payload = UploadStatusResponse.fromJson(expected);

    expect('UPLOADING', payload.status);
    expect(0.856, payload.percentage);

    var first = payload.items.first;

    expect('test.txt', first.name);
    expect(54321, first.size);
    expect(6, first.sheets);
    expect(123456789, first.date);
    expect('abcdefghijklmnopqrstuvwxyz', first.id);
  });

  test('To JSON', () {
    var payload = UploadStatusResponse('UPLOADING', 0.856, [ListItem('test.txt', 54321, 6, 123456789, 'abcdefghijklmnopqrstuvwxyz')]);

    expect(expected, payload.toJson());
  });
}
