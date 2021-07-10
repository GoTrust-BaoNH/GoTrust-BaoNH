import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/emergency/controller/emergency_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/models/emergency/emergency_model.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/title_widget/title_base_widget.dart';

part 'emergency_children.dart';

class EmergencyScreen extends GetView<EmergencyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBase(
            context,
            title: 'urgent_contact'.tr,
            color: AppColor.primaryTextColorLight,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
          ),
          Expanded(
            child: _listHotline(onItemPressed: (item) {
              controller.onItemListServicePressed(item);
            }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: AppGradientButton(
              onPressed: () {
                // print
              },
              child: Text(
                'chat_now'.tr,
                style: TextStyle(
                  color: AppColor.secondTextColorLight,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
