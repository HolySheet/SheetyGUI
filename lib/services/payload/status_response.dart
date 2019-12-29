import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

abstract class StatusResponse extends BasicPayload {
  StatusResponse(int code, PayloadType type, String message)
      : super(code, type, message);

  StatusResponse.fromJson(Map<String, dynamic> json,
      {int code, PayloadType type, String message, String state})
      : super.fromJson(json, code: code, type: type, message: message, state: state);

  String get status;

  double get percentage;
}
