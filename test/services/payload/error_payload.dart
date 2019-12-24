import 'dart:convert';

import 'package:sheety_gui/services/payload/error.dart';
import 'package:sheety_gui/services/payload/list_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 0,
  "type": 0,
  "message": "Error message",
  "stacktrace": "Stacktrace here"
}
''');

void main() {
  test('JSON should be serialized to an expected value', () {
    var payload = ErrorPayload.fromJson(expected);

    expect(0, payload.code);
    expect(0, payload.type.type);
    expect('Error message', payload.message);
    expect('Stacktrace here', payload.stacktrace);
  });

  test('JSON should be deserialized to an expected value', () {
    var payload = ErrorPayload('Stacktrace here', 'Error message');

    expect(expected, payload.toJson());
  });
}
