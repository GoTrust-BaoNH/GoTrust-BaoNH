import 'repairing_order_model.dart';

class RepairingOrderResponseModel {
  RepairingOrderResponseModel({
    required this.code,
    this.data,
    this.error,
    this.message,
  });

  int code;
  RepairingOrderModel? data;
  String? error;
  String? message;
}
