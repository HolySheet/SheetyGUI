import 'dart:convert';

import 'package:sheety_gui/services/payload/error_payload.dart';
import 'package:sheety_gui/services/payload/list_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 0,
  "type": 0,
  "message": "Error message",
  "state": null,
  "stacktrace": "Stacktrace here"
}
''');

void main() {
  test('From JSON', () {
    var payload = ErrorPayload.fromJson(expected);

    expect(payload.code, 0);
    expect(payload.type.type, 0);
    expect(payload.message, 'Error message');
    expect(payload.stacktrace, 'Stacktrace here');
  });

  test('To JSON', () {
    var payload = ErrorPayload('Stacktrace here', 'Error message');

    expect(expected, payload.toJson());
  });
}
