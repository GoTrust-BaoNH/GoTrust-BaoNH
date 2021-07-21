class NotificationItemModel {
  NotificationItemModel({
    this.htmlContent,
    this.icon,
    this.id,
    this.isRead,
    this.time,
    this.type,
  });

  final String? htmlContent;
  final String? icon;
  final String? id;
  final bool? isRead;
  final String? time;
  final int? type;
}
