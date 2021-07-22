part of 'notification_screen.dart';

extension NotificaitonsExtension on NotificationScreen {
  Widget _listNotifications({required Function(NotificationModel) onItemPressed}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        runSpacing: 4,
        children: List<Widget>.generate(
          controller.list.value.length,
          (index) {
            //final item = controller.list[index];
            // return _notificationItem(
            //   notificationType: item.notificationType,
            //   isExpired: item.isExpired,
            //   status: item.status,
            //   description: item.description,
            //   createTime: item.createTime,
            //   onItemPressed: () => onItemPressed(item),
            // );

            // Widget html = Html(data: controller.list[index].htmlContent);
            Widget html = Html(data: dataNotificationMock);
            return GestureDetector(
              onTap: () {
                controller.onTapItemNotification(controller.list[index]);
              },
              child: html,
            );
          },
        ),
      ),
    );
  }

  Widget _buildLeadingIcon({
    required ProductEnum notificationType,
    bool isExpired = true,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: isExpired ? AppColor.primaryColorLight : AppColor.accentColorLight,
          width: 1,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FCoreImage(
            notificationType.icon,
            width: 36,
            height: 36,
          ),
        ),
        Container(
          color: AppColor.dividerColorLight.withOpacity(0.2),
          width: 0.5,
          height: 54,
        ),
      ],
    );
  }

  Widget _notificationItem({
    required ProductEnum notificationType,
    required String status,
    required String description,
    required String createTime,
    required Function() onItemPressed,
    bool isExpired = true,
  }) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: InkWell(
        onTap: onItemPressed,
        child: Container(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            children: [
              _buildLeadingIcon(
                notificationType: notificationType,
                isExpired: isExpired,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: AppColor.primaryTextColorLight,
                        fontFamily: TextAppStyle.appFont,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: description,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: AppColor.primaryTextColorLight,
                                fontFamily: TextAppStyle.appFont,
                              ),
                            ),
                            const TextSpan(text: ' '),
                            TextSpan(
                              text: notificationType.productName,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: isExpired ? AppColor.accentColorLight : AppColor.primaryColorLight,
                                fontFamily: TextAppStyle.appFont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                createTime,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: AppColor.dividerColorLight,
                  fontFamily: TextAppStyle.appFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
