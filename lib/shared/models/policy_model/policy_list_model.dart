import 'policy_model.dart';

class PolicyListModel {
  PolicyListModel({
    required this.pageNumber,
    required this.pageSize,
    this.data,
  });

  List<PolicyModel?>? data;
  int pageNumber;
  int pageSize;
}
