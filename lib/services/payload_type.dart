class PayloadType {

  static const PayloadType ERROR = PayloadType(0, true);
  static const PayloadType LIST_REQUEST = PayloadType(1, false);
  static const PayloadType LIST_RESPONSE = PayloadType(2, true);
  static const PayloadType UPLOAD_REQUEST = PayloadType(3, true);
  static const PayloadType UPLOAD_STATUS_RESPONSE = PayloadType(4, false);
  static const PayloadType DOWNLOAD_REQUEST = PayloadType(5, true);
  static const PayloadType DOWNLOAD_STATUS_RESPONSE = PayloadType(6, false);
  static const PayloadType REMOVE_REQUEST = PayloadType(7, true);
  static const PayloadType REMOVE_STATUS_RESPONSE = PayloadType(8, false);

  static const List<PayloadType> values = [ERROR, LIST_REQUEST, LIST_RESPONSE, UPLOAD_REQUEST, UPLOAD_STATUS_RESPONSE, DOWNLOAD_REQUEST, DOWNLOAD_STATUS_RESPONSE, REMOVE_REQUEST, REMOVE_STATUS_RESPONSE];

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