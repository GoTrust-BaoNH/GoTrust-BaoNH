class CategoryModel {
  CategoryModel({
    required this.id,
    this.code,
    this.createdDate,
    this.name,
    this.updatedDate,
  });

  String? code;
  String? createdDate;
  int id;
  String? name;
  String? updatedDate;
}
