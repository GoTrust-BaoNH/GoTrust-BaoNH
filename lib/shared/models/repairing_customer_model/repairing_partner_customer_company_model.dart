class RepairingPartnerCustomerCompanyModel {
  RepairingPartnerCustomerCompanyModel({
    required this.id,
    this.address,
    this.album,
    this.avatar,
    this.companyCode,
    this.createdAt,
    this.name,
    this.phone,
    this.publishedAt,
    this.updatedAt,
    this.uuid,
    this.customerCompany = false,
    this.workerCompany = false,
  });

  String? address;
  List<String?>? album;
  List<String?>? avatar;
  String? companyCode;
  String? createdAt;
  int id;
  String? name;
  String? phone;
  String? publishedAt;
  String? updatedAt;
  String? uuid;
  bool customerCompany;
  bool workerCompany;
}
