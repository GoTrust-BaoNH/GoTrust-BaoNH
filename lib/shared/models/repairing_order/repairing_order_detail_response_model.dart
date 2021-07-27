import 'repairing_order_detail_model.dart';

class RepairingOrderDetailResponseModel {
  RepairingOrderDetailResponseModel({
    required this.code,
    this.data,
    this.error,
    this.message,
  });

  int code;
  RepairingOrderDetailModel? data;
  String? error;
  String? message;
}
