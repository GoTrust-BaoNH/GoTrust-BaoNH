class RecuseOrderModel {
  RecuseOrderModel({
    required this.status,
    this.message,
    this.orderId,
  });

  String? message;
  String? orderId;
  int status;
}
