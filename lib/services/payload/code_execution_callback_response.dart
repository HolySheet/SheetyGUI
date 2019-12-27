import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/serialized_variable.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [CodeExecutionCallbackResponse](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#CodeExecutionCallbackResponse-11)
class CodeExecutionCallbackResponse extends BasicPayload {
  final String callbackState;
  final List<String> snippetResult;
  final List<SerializedVariable> variables;

  CodeExecutionCallbackResponse(
      this.callbackState, this.snippetResult, this.variables,
      [String message = 'Success'])
      : super(1, PayloadType.CODE_EXECUTION_CALLBACK_RESPONSE, message);

  CodeExecutionCallbackResponse.fromJson(Map<String, dynamic> json)
      : callbackState = json['callbackState'],
        snippetResult = List<String>.from(json['snippetResult']),
        variables = SerializedVariable.fromList(json['variables']),
        super.fromJson(json,
            type: PayloadType.CODE_EXECUTION_CALLBACK_RESPONSE);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'callbackState': callbackState,
      'snippetResult': snippetResult,
      'variables': SerializedVariable.jsonFromList(variables)
    });

  @override
  String toString() {
    return 'CodeExecutionCallbackRequest{code: $code, type: $type, message: $message, state: $state, callbackState: $callbackState, snippetResult: $snippetResult, variables: $variables}';
  }
}
