import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [RemoveStatusResponse](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#RemoveStatusResponse-8)
class RemoveStatusResponse extends BasicPayload {
  final String status;
  final double percentage;

  RemoveStatusResponse(this.status, this.percentage,
      [String message = 'Success'])
      : super(1, PayloadType.REMOVE_STATUS_RESPONSE, message);

  RemoveStatusResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        percentage = json['percentage'],
        super.fromJson(json, type: PayloadType.REMOVE_STATUS_RESPONSE);

  Map<String, dynamic> toJson() =>
      super.toJson()..addAll({'status': status, 'percentage': percentage});

  @override
  String toString() {
    return 'RemoveStatusResponse{code: $code, type: $type, message: $message, state: $state, status: $status, percentage: $percentage}';
  }
}
