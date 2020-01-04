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
      "id": "abcdefghijklmnopqrstuvwxyz",
      "selfOwned": false,
      "owner": "Some Owner"
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

    expect(first.name, 'test.txt');
    expect(first.size, 54321);
    expect(first.sheets, 6);
    expect(first.date, 123456789);
    expect(first.id, 'abcdefghijklmnopqrstuvwxyz');
    expect(first.selfOwned, false);
    expect(first.owner, 'Some Owner');
  });

  test('To JSON', () {
    var payload = UploadStatusResponse('UPLOADING', 0.856, [ListItem('test.txt', 54321, 6, 123456789, 'abcdefghijklmnopqrstuvwxyz', false, 'Some Owner')]);

    expect(payload.toJson(), expected);
  });
}
