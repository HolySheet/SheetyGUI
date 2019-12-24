import 'package:flutter/material.dart';
import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// See [ErrorPayload](https://github.com/RubbaBoy/HolySheet/blob/master/SocketProtocol.md#ErrorPayload-0)
class ErrorPayload extends BasicPayload {
  final String stacktrace;

  ErrorPayload(this.stacktrace, [String message = 'Error'])
      : super(0, PayloadType.ERROR, message);

  ErrorPayload.fromJson(Map<String, dynamic> json)
      : stacktrace = json['stacktrace'],
        super.fromJson(json, type: PayloadType.ERROR);

  Map<String, dynamic> toJson() =>
      super.toJson()..addAll({'stacktrace': stacktrace});

  @override
  String toString() {
    return 'ErrorPayload{code: $code, type: $type, message: $message, state: $state, stacktrace: $stacktrace}';
  }
}
