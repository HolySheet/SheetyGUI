import 'dart:convert';

import 'package:sheety_gui/services/payload/list_request.dart';
import 'package:sheety_gui/services/payload/list_response.dart';
import 'package:sheety_gui/services/payload_type.dart';
import 'package:test/test.dart';

final expected = jsonDecode('''
{
  "code": 1,
  "type": 1,
  "message": "Success",
  "query": "Query"
}
''');

void main() {
  test('JSON should be serialized to an expected value', () {
    var payload = ListRequest.fromJson(expected);

    expect('Query', payload.query);
  });

  test('JSON should be deserialized to an expected value', () {
    var payload = ListRequest('Query');

    expect(expected, payload.toJson());
  });
}
