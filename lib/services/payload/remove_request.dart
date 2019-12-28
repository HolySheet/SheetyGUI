import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [RemoveRequest](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#RemoveRequest-8)
class RemoveRequest extends BasicPayload {
  final String id;

  RemoveRequest(this.id, [String message = 'Success'])
      : super(1, PayloadType.REMOVE_REQUEST, message);

  RemoveRequest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        super.fromJson(json, type: PayloadType.REMOVE_REQUEST);

  Map<String, dynamic> toJson() => super.toJson()..addAll({'id': id});

  @override
  String toString() {
    return 'RemoveRequest{code: $code, type: $type, message: $message, state: $state, id: $id}';
  }
}
