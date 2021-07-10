import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/notification/controller/notification_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/models/notification/notifications_model.dart';
import 'package:go_trust/shared/models/product/product_enum.dart';
import 'package:go_trust/shared/styles/text_style.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/title_widget/title_base_widget.dart';

part 'notification_children.dart';

class NotificationScreen extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context, title: 'Notificatons'),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: titleBase(
              context,
              title: 'Thông báo',
              color: AppColor.primaryTextColorLight,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
            ),
          ),
          Expanded(
            child: _listNotifications(onItemPressed: (item) {}),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Xem thêm thông báo',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.primaryColorLight,
                fontFamily: TextAppStyle.appFont,
              ),
            ),
          )
        ],
      ),
    );
  }
}
