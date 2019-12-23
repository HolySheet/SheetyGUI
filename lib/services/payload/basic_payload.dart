import 'package:sheety_gui/services/payload_type.dart';

/// A superclass for all json requests and responses. Example json is:
/// <pre>
///     {
///         "code": 1,
///         "type": 1,
///         "message": "Success"
///     }
/// </pre>
///
/// <b>code</b>: The response code of the payload, 1 being successful, <1 unsuccessful.<br>
/// <b>type</b>: The type of the response for non-dynamic languages like this one. Derived from the [PayloadType] enum.<br>
/// <b>message</b>: Any extra details of the request/response, used for things like errors. The state of the request should not<br>
///      depend on this text.
class BasicPayload {
  int code;
  PayloadType type;
  String message;

  BasicPayload(this.code, this.type, this.message);

  BasicPayload.fromJson(Map<String, dynamic> json,
      {this.code, this.type, this.message}) {
    code ??= json['code'];
    type ??= PayloadType(json['type']);
    message ??= json['message'];
  }

  Map<String, dynamic> toJson() =>
      {'code': code, 'type': type.type, 'message': message};
}
