import 'package:go_trust/shared/models/repairing_order/repairing_order_model.dart';

class PageRepairingOrderModel {
  PageRepairingOrderModel({
    required this.limit,
    required this.start,
    required this.total,
    this.list,
  });

  int limit;
  List<RepairingOrderModel?>? list;
  int start;
  int total;
}
