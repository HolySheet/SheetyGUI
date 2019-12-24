class PayloadType {

  static const PayloadType ERROR = PayloadType(0, true);
  static const PayloadType LIST_REQUEST = PayloadType(1, false);
  static const PayloadType LIST_RESPONSE = PayloadType(2, true);

  static const List<PayloadType> values = [ERROR, LIST_REQUEST, LIST_RESPONSE];

  final int type;
  final bool receivable;

  const PayloadType(this.type, this.receivable);

  static fromType(int type) =>
      values.firstWhere((payload) => payload.type == type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayloadType &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;

  @override
  String toString() {
    return '$type';
  }
}