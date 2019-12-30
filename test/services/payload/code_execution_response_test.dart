import 'dart:convert';

import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/code_execution_request.dart';
import 'package:sheety_gui/services/payload/code_execution_response.dart';
import 'package:sheety_gui/services/payload/serialized_variable.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode(r'''
{
  "code": 1,
  "type": 10,
  "message": "Success",
  "state": null,
  "snippetResult": ["$1"],
  "variables": [
    {
      "name": "$1",
      "type": "java.util.ImmutableCollections.Map1",
      "object": {
        "one": 1
      }
    }
  ]
}
''');

void main() {
  test('From JSON', () {
    var payload = CodeExecutionResponse.fromJson(expected);

    expect(payload.snippetResult, <String>[r'$1']);
    expect(payload.variables, [SerializedVariable(r'$1', 'java.util.ImmutableCollections.Map1', {'one': 1})]);
  });

  test('To JSON', () {
    var payload = CodeExecutionResponse([r'$1'], [SerializedVariable(r'$1', 'java.util.ImmutableCollections.Map1', {'one': 1})]);

    expect(payload.toJson(), expected);
  });
}
