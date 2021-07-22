class EmergencyModel {
  EmergencyModel({
    required this.id,
    this.address,
    this.createdDate,
    this.phone,
    this.serviceName,
    this.updatedDate,
  });

  String? address;
  String? createdDate;
  int id;
  String? phone;
  String? serviceName;
  String? updatedDate;
}
