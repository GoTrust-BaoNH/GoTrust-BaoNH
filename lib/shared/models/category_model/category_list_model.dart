import 'package:go_trust/shared/models/category_model/category_model.dart';

class CategoryListModel {
  CategoryListModel({
    required this.pageNumber,
    required this.pageSize,
    this.data,
  });

  List<CategoryModel?>? data;
  int pageNumber;
  int pageSize;
}
