import 'emergency_model.dart';

class EmergencyListModel {
  EmergencyListModel({
    required this.pageNumber,
    required this.pageSize,
    this.data,
  });

  List<EmergencyModel?>? data;
  int pageNumber;
  int pageSize;
}
