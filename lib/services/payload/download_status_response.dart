import 'package:flutter/material.dart';
import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

class DownloadStatusResponse extends BasicPayload {
  final String status;
  final double percentage;

  DownloadStatusResponse(this.status, this.percentage,
      [String message = 'Success'])
      : super(1, PayloadType.DOWNLOAD_STATUS_RESPONSE, message);

  DownloadStatusResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        percentage = json['percentage'],
        super.fromJson(json, type: PayloadType.DOWNLOAD_STATUS_RESPONSE);

  Map<String, dynamic> toJson() =>
      super.toJson()..addAll({'status': status, 'percentage': percentage});

  @override
  String toString() {
    return 'DownloadStatusResponse{code: $code, type: $type, message: $message, state: $state, status: $status, percentage: $percentage}';
  }
}
