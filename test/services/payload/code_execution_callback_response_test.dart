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

    expect(payload.callbackState, '030ccb35-8e0b-4c13-a0a1-9a6347ad8849');
    expect(payload.snippetResult, <String>['theTime', 'theTimeHalved']);
    expect(payload.variables[0], SerializedVariable('theTime', 'java.lang.Long', 1577394471130));
    expect(payload.variables[1], SerializedVariable('theTimeHalved', 'java.lang.Long', 788697235565));
  });

  test('To JSON', () {
    var payload = CodeExecutionCallbackResponse('030ccb35-8e0b-4c13-a0a1-9a6347ad8849', ['theTime', 'theTimeHalved'], [SerializedVariable('theTime', 'java.lang.Long', 1577394471130), SerializedVariable('theTimeHalved', 'java.lang.Long', 788697235565)]);

    expect(payload.toJson(), expected);
  });
}
