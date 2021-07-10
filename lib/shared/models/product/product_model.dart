import 'product_enum.dart';

class YourProductModel {
  YourProductModel({
    required this.productType,
    required this.productName,
    required this.contractCode,
    required this.price,
    required this.expiredDate,
    this.isContractProcessing = false,
  });

  final ProductEnum productType;
  final String productName;
  final String contractCode;
  final String price;
  final String expiredDate;
  final bool isContractProcessing;
}
