import 'dart:convert';

import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/code_execution_request.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode(r'''
{
  "code": 1,
  "type": 9,
  "message": "Success",
  "state": null,
  "invokeCode": "Map.of(\"one\", 1)",
  "returnVariables": [
    "x",
    "y"
  ]
}
''');

void main() {
  test('From JSON', () {
    var payload = CodeExecutionRequest.fromJson(expected);

    expect(payload.invokeCode, r'Map.of("one", 1)');
    expect(payload.returnVariables, ['x', 'y']);
  });

  test('To JSON', () {
    var payload = CodeExecutionRequest(r'Map.of("one", 1)', ['x', 'y']);

    expect(payload.toJson(), expected);
  });
}
