import 'package:sheety_gui/services/payload_type.dart';

/// See [BasicPayload](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#BasicPayload)
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
