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
