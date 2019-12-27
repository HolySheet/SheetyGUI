import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [ListRequest](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#ListRequest-1)
class ListRequest extends BasicPayload {
  final String query;

  ListRequest(this.query, [String message = 'Success'])
      : super(1, PayloadType.LIST_REQUEST, message);

  ListRequest.fromJson(Map<String, dynamic> json)
      : query = json['query'],
        super.fromJson(json, type: PayloadType.LIST_REQUEST);

  Map<String, dynamic> toJson() => super.toJson()..addAll({'query': query});

  @override
  String toString() {
    return 'ListRequest{code: $code, type: $type, message: $message, state: $state, query: $query}';
  }
}
