import 'promotion_model.dart';

class PromotionListModel {
  PromotionListModel({
    required this.pageNumber,
    required this.pageSize,
    this.data,
  });

  List<PromotionModel?>? data;
  int pageNumber;
  int pageSize;
}
