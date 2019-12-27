import 'dart:convert';

import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/code_execution_callback_response.dart';
import 'package:sheety_gui/services/payload/code_execution_request.dart';
import 'package:sheety_gui/services/payload/code_execution_response.dart';
import 'package:sheety_gui/services/payload/serialized_variable.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 11,
  "message": "Success",
  "state": null,
  "callbackState": "030ccb35-8e0b-4c13-a0a1-9a6347ad8849",
  "snippetResult": [
    "theTime",
    "theTimeHalved"
  ],
  "variables": [
    {
      "name": "theTime",
      "type": "java.lang.Long",
      "object": 1577394471130
    },
    {
      "name": "theTimeHalved",
      "type": "java.lang.Long",
      "object": 788697235565
    }
  ]
}
''');

void main() {
  test('From JSON', () {
    var payload = CodeExecutionCallbackResponse.fromJson(expected);

    expect('030ccb35-8e0b-4c13-a0a1-9a6347ad8849', payload.callbackState);
    expect(<String>['theTime', 'theTimeHalved'], payload.snippetResult);
    expect(SerializedVariable('theTime', 'java.lang.Long', 1577394471130), payload.variables[0]);
    expect(SerializedVariable('theTimeHalved', 'java.lang.Long', 788697235565), payload.variables[1]);
  });

  test('To JSON', () {
    var payload = CodeExecutionCallbackResponse('030ccb35-8e0b-4c13-a0a1-9a6347ad8849', ['theTime', 'theTimeHalved'], [SerializedVariable('theTime', 'java.lang.Long', 1577394471130), SerializedVariable('theTimeHalved', 'java.lang.Long', 788697235565)]);

    expect(expected, payload.toJson());
  });
}
