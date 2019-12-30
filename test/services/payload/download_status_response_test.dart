import 'dart:convert';

import 'package:sheety_gui/services/payload/download_status_response.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 6,
  "message": "Success",
  "state": null,
  "status": "DOWNLOADING",
  "percentage": 0.856
}
''');

void main() {
  test('From JSON', () {
    var payload = DownloadStatusResponse.fromJson(expected);

    expect(payload.status, 'DOWNLOADING');
    expect(payload.percentage, 0.856);
  });

  test('To JSON', () {
    var payload = DownloadStatusResponse('DOWNLOADING', 0.856);

    expect(payload.toJson(), expected);
  });
}
