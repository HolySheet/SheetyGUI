import 'dart:convert';

import 'package:sheety_gui/services/payload/remove_status_response.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 8,
  "message": "Success",
  "state": null,
  "status": "REMOVING",
  "percentage": 0.856
}
''');

void main() {
  test('From JSON', () {
    var payload = RemoveStatusResponse.fromJson(expected);

    expect(payload.status, 'REMOVING');
    expect(payload.percentage, 0.856);
  });

  test('To JSON', () {
    var payload = RemoveStatusResponse('REMOVING', 0.856);

    expect(payload.toJson(), expected);
  });
}
