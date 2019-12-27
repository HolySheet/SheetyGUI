import 'package:collection/collection.dart';

class SerializedVariable {
  Function deepEq = const DeepCollectionEquality().equals;

  String name;
  String type;
  dynamic object;

  SerializedVariable(this.name, this.type, this.object);

  SerializedVariable.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'],
        object = json['object'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'type': type, 'object': object};

  static List<SerializedVariable> fromList(List<dynamic> list) =>
      list.map((dyn) => SerializedVariable.fromJson(dyn)).toList();

  static List<Map<String, dynamic>> jsonFromList(
          List<SerializedVariable> list) =>
      list.map((serialized) => serialized.toJson()).toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerializedVariable &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type &&
          deepEq(object, other.object);

  @override
  int get hashCode => name.hashCode ^ type.hashCode ^ object.hashCode;

  @override
  String toString() {
    return 'SerializedVariable{name: $name, type: $type, object: $object}';
  }
}
