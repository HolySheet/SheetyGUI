import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [UploadStatusResponse](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#UploadStatusResponse-4)
class UploadStatusResponse extends BasicPayload {
  final String status;
  final double percentage;

  UploadStatusResponse(this.status, this.percentage,
      [String message = 'Success'])
      : super(1, PayloadType.UPLOAD_STATUS_RESPONSE, message);

  UploadStatusResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        percentage = json['percentage'],
        super.fromJson(json, type: PayloadType.UPLOAD_STATUS_RESPONSE);

  Map<String, dynamic> toJson() =>
      super.toJson()..addAll({'status': status, 'percentage': percentage});

  @override
  String toString() {
    return 'UploadStatusResponse{code: $code, type: $type, message: $message, state: $state, status: $status, percentage: $percentage}';
  }
}
