import 'package:flutter/material.dart';
import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// Json sent to the Java server to request the listing of files, with an
/// optional search query. Example json (Excluding [BasicPayload]) is:
/// <pre>
///     {
///         "query": "Query"
///     }
/// </pre>
///
/// <b>query</b>: A string payload to search files to list. This can be null.
class ErrorPayload extends BasicPayload {
  final String stacktrace;

  ErrorPayload(this.stacktrace, [String message = 'Error'])
      : super(0, PayloadType.ERROR, message);

  ErrorPayload.fromJson(Map<String, dynamic> json)
      : stacktrace = json['stacktrace'],
        super.fromJson(json, type: PayloadType.ERROR);

  Map<String, dynamic> toJson() => super.toJson()..addAll({'stacktrace': stacktrace});

  @override
  String toString() {
    return 'ErrorPayload{code: $code, type: $type, message: $message, state: $state, stacktrace: $stacktrace}';
  }
}
