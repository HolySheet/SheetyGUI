class PayloadType {

  static const PayloadType ERROR = PayloadType(0, true);
  static const PayloadType LIST_REQUEST = PayloadType(1, false);
  static const PayloadType LIST_RESPONSE = PayloadType(2, true);
  static const PayloadType UPLOAD_REQUEST = PayloadType(3, true, true);
  static const PayloadType UPLOAD_STATUS_RESPONSE = PayloadType(4, false);
  static const PayloadType DOWNLOAD_REQUEST = PayloadType(5, true, true);
  static const PayloadType DOWNLOAD_STATUS_RESPONSE = PayloadType(6, false);
  static const PayloadType REMOVE_REQUEST = PayloadType(7, true, true);
  static const PayloadType REMOVE_STATUS_RESPONSE = PayloadType(8, false);
  static const PayloadType CODE_EXECUTION_REQUEST = PayloadType(9, false);
  static const PayloadType CODE_EXECUTION_RESPONSE = PayloadType(10, true);
  static const PayloadType CODE_EXECUTION_CALLBACK_RESPONSE = PayloadType(11, true);

  static const List<PayloadType> values = [ERROR, LIST_REQUEST, LIST_RESPONSE, UPLOAD_REQUEST, UPLOAD_STATUS_RESPONSE, DOWNLOAD_REQUEST, DOWNLOAD_STATUS_RESPONSE, REMOVE_REQUEST, REMOVE_STATUS_RESPONSE, CODE_EXECUTION_REQUEST, CODE_EXECUTION_RESPONSE, CODE_EXECUTION_CALLBACK_RESPONSE];

  final int type;
  final bool receivable;
  final bool hasStatusResponse;

  const PayloadType(this.type, this.receivable, [this.hasStatusResponse = false]);

  static PayloadType fromType(int type) =>
      values.firstWhere((payload) => payload.type == type, orElse: () => null);

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