import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/serialized_variable.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [CodeExecutionResponse](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#CodeExecutionResponse-10)
class CodeExecutionResponse extends BasicPayload {
  final List<String> snippetResult;
  final List<SerializedVariable> variables;

  CodeExecutionResponse(this.snippetResult, this.variables,
      [String message = 'Success'])
      : super(1, PayloadType.CODE_EXECUTION_RESPONSE, message);

  CodeExecutionResponse.fromJson(Map<String, dynamic> json)
      : snippetResult = List<String>.from(json['snippetResult']),
        variables = SerializedVariable.fromList(json['variables']),
        super.fromJson(json, type: PayloadType.CODE_EXECUTION_RESPONSE);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      'snippetResult': snippetResult,
      'variables': SerializedVariable.jsonFromList(variables)
    });

  @override
  String toString() {
    return 'CodeExecutionResponse{code: $code, type: $type, message: $message, state: $state, snippetResult: $snippetResult, variables: $variables}';
  }
}
