class ProductModel {
  ProductModel({
    required this.categoryId,
    required this.id,
    required this.price,
    this.code,
    this.createdDate,
    this.description,
    this.name,
    this.updatedDate,
  });

  int categoryId;
  String? code;
  String? createdDate;
  String? description;
  int id;
  String? name;
  double price;
  String? updatedDate;
}
