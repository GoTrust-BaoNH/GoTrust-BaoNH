import 'package:go_trust/shared/models/product/product_model.dart';

class ProductListModel {
  ProductListModel({
    required this.pageNumber,
    required this.pageSize,
    this.data,
  });

  List<ProductModel?>? data;
  int pageNumber;
  int pageSize;
}
