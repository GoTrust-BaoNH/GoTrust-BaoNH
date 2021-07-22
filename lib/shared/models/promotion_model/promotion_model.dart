class PromotionModel {
  PromotionModel({
    required this.id,
    this.code,
    this.createdDate,
    this.description,
    this.name,
    this.updatedDate,
  });

  String? code;
  String? createdDate;
  String? description;
  int id;
  String? name;
  String? updatedDate;
}
