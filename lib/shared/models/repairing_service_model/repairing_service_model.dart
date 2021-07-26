import 'repairing_service_title_model.dart';

class RepairingServiceModel {
  RepairingServiceModel({
    required this.id,
    this.code,
    this.createdAt,
    this.createdBy,
    this.name,
    this.publishedAt,
    this.service,
    this.title,
    this.updatedAt,
    this.updatedBy,
    this.uuid,
  });

  String? code;
  String? createdAt;
  String? createdBy;
  int id;
  String? name;
  String? publishedAt;
  RepairingServiceModel? service;
  RepairingServiceTitleModel? title;
  String? updatedAt;
  String? updatedBy;
  String? uuid;
}
