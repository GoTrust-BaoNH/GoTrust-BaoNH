import 'package:go_trust/shared/models/product/product_enum.dart';

class NotificationModel {
  NotificationModel({
    required this.notificationType,
    required this.status,
    required this.description,
    required this.createTime,
    this.isExpired = false,
  });

  final ProductEnum notificationType;
  final String status;
  final String description;
  final String createTime;
  final bool isExpired;
}
