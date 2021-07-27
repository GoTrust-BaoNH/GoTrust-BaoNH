import 'repairing_service_model.dart';

class RepairingServiceResponseModel {
  RepairingServiceResponseModel({
    required this.code,
    this.data,
    this.error,
    this.message,
  });

  int code;
  List<RepairingServiceModel?>? data;
  String? error;
  String? message;
}
