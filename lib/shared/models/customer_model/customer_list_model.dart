import 'customer_model.dart';

class CustomerListModel {
  CustomerListModel({
    required this.pageNumber,
    required this.pageSize,
    this.data,
  });

  List<CustomerModel?>? data;
  int pageNumber;
  int pageSize;
}
