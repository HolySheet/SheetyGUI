import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [ListResponse](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#ListResponse-2)
class ListResponse extends BasicPayload {
  final List<ListItem> items;

  ListResponse(this.items, [String message = 'Success'])
      : super(1, PayloadType.LIST_RESPONSE, message);

  ListResponse.fromJson(Map<String, dynamic> json)
      : items =
            [...json['items']].map((inj) => ListItem.fromJson(inj)).toList(),
        super.fromJson(json, type: PayloadType.LIST_RESPONSE);

  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({'items': items.map((item) => item.toJson()).toList()});

  @override
  String toString() {
    return 'ListResponse{code: $code, type: $type, message: $message, state: $state, items: $items}';
  }
}

