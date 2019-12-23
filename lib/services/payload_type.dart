class PayloadType {

  static const PayloadType LIST = PayloadType(1);

  final int type;

  const PayloadType(this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PayloadType &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}