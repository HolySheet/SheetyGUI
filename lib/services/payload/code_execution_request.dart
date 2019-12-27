import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [CodeExecutionRequest](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#CodeExecutionRequest-9)
class CodeExecutionRequest extends BasicPayload {
  final String invokeCode;
  final List<String> returnVariables;

  CodeExecutionRequest(this.invokeCode, [this.returnVariables = const [], String message = 'Success'])
      : super(1, PayloadType.CODE_EXECUTION_REQUEST, message);

  CodeExecutionRequest.fromJson(Map<String, dynamic> json)
      : invokeCode = json['invokeCode'],
        returnVariables = List<String>.from(json['returnVariables']),
        super.fromJson(json, type: PayloadType.CODE_EXECUTION_REQUEST);

  Map<String, dynamic> toJson() =>
      super.toJson()..addAll({'invokeCode': invokeCode, 'returnVariables': returnVariables});

  @override
  String toString() {
    return 'CodeExecutionRequest{code: $code, type: $type, message: $message, state: $state, invokeCode: $invokeCode, returnVariables: $returnVariables}';
  }
}
