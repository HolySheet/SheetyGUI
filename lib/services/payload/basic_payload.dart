import 'package:sheety_gui/services/payload_type.dart';

/// A superclass for all json requests and responses. Example json is:
/// <pre>
///     {
///         "code": 1,
///         "type": 1,
///         "message": "Success",
///         "state": "0317d1f0-6053-4cce-89ba-9e896784820a"
///     }
/// </pre>
///
/// <b>code</b>: The response code of the payload, 1 being successful, <1 unsuccessful.<br>
/// <b>type</b>: The type of the response for non-dynamic languages like this one. Derived from the [PayloadType] enum.<br>
/// <b>message</b>: Any extra details of the request/response, used for things like errors. The state of the request should not
///      depend on this text. <br>
/// <b>state</b>: A UUID state generated for a request, and reused for the requests's
///     response, weather it be a proper response or error. This is to ensure the correct pairing of otherwise unordered requests and responses
class BasicPayload {
  int code;
  PayloadType type;
  String message;
  String state;

  BasicPayload(this.code, this.type, this.message, [this.state]);

  BasicPayload.fromJson(Map<String, dynamic> json,
      {this.code, this.type, this.message, this.state}) {
    code ??= json['code'];
    type ??= PayloadType.fromType(json['type']);
    message ??= json['message'];
    state ??= json['state'];
  }

  Map<String, dynamic> toJson() =>
      {'code': code, 'type': type.type, 'message': message, 'state': state};

  @override
  String toString() {
    return 'BasicPayload{code: $code, type: $type, message: $message, state: $state}';
  }
}
