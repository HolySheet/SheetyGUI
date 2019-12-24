import 'package:flutter/material.dart';
import 'package:sheety_gui/services/payload/basic_payload.dart';
import 'package:sheety_gui/services/payload_type.dart';

/// Json sent to a client in response to a request the listing of files.
/// Example json (Excluding [BasicPayload]) is:
/// <pre>
///     {
///         "items": [
///              {
///                "name": "test.txt",
///                "size": 42069,
///                "sheets": 6,
///                "date": 123456789,
///                "id": "abcdefghijklmnopqrstuvwxyz"
///              }
///          ]
///     }
/// </pre>
///
/// <b>items</b>: A collection of files/items retrieved.<br><br>
/// The following descriptions are in the objects <b>items</b> contains.<br>
/// <b>name</b>: The name of the file<br>
/// <b>size</b>: The size of the file in bytes<br>
/// <b>sheets</b>: The amount of sheets the file consists of<br>
/// <b>date</b>: The millisecond timestamp the file was created<br>
/// <b>id</b>: The ID of the file<br>
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

class ListItem {
  String name;
  int size;
  int sheets;
  int date;
  String id;

  ListItem(this.name, this.size, this.sheets, this.date, this.id);

  ListItem.fromJson(Map<String, dynamic> json,
      {this.name, this.size, this.sheets, this.date, this.id}) {
    name ??= json['name'];
    size ??= json['size'];
    sheets ??= json['sheets'];
    date ??= json['date'];
    id ??= json['id'];
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'size': size, 'sheets': sheets, 'date': date, 'id': id};

  @override
  String toString() {
    return 'ListItem{name: $name, size: $size, sheets: $sheets, date: $date, id: $id}';
  }
}
