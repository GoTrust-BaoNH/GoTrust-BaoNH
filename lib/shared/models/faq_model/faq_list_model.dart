import 'faq_model.dart';

class FaqListModel {
  FaqListModel({
    required this.pageNumber,
    required this.pageSize,
    this.data,
  });

  List<FaqModel?>? data;
  int pageNumber;
  int pageSize;
}
