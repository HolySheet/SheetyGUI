import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload/list_item.dart';
import 'package:sheety_gui/services/payload/status_response.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [UploadStatusResponse](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#UploadStatusResponse-4)
class UploadStatusResponse extends BasicPayload implements StatusResponse {
  final String status;
  final double percentage;
  final List<ListItem> items;

  UploadStatusResponse(this.status, this.percentage, this.items,
      [String message = 'Success'])
      : super(1, PayloadType.UPLOAD_STATUS_RESPONSE, message);

  UploadStatusResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        percentage = json['percentage'],
        items =
  [...json['items']].map((inj) => ListItem.fromJson(inj)).toList(),
        super.fromJson(json, type: PayloadType.UPLOAD_STATUS_RESPONSE);

  Map<String, dynamic> toJson() =>
      super.toJson()..addAll({'status': status, 'percentage': percentage, 'items': items.map((item) => item.toJson()).toList()});

  @override
  String toString() {
    return 'UploadStatusResponse{code: $code, type: $type, message: $message, state: $state, status: $status, percentage: $percentage, items: $items}';
  }
}
