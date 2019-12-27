import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

class CodeExecutionRequest extends BasicPayload {
  final String invokeCode;

  CodeExecutionRequest(this.invokeCode, [String message = 'Success'])
      : super(1, PayloadType.CODE_EXECUTION_REQUEST, message);

  CodeExecutionRequest.fromJson(Map<String, dynamic> json)
      : invokeCode = json['invokeCode'],
        super.fromJson(json, type: PayloadType.CODE_EXECUTION_REQUEST);

  Map<String, dynamic> toJson() =>
      super.toJson()..addAll({'invokeCode': invokeCode});

  @override
  String toString() {
    return 'CodeExecutionRequest{code: $code, type: $type, message: $message, state: $state, invokeCode: $invokeCode}';
  }
}
