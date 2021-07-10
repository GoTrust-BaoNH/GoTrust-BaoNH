import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';
import 'package:get/get.dart';

class UserInfoScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appbar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
                width: width,
              ),
              Text(
                'input_info'.tr,
                style: TextStyle(
                  color: AppColor.primaryTextColorLight,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'input_info_follow'.tr,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.primaryHintColorLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'help_buy_faster'.tr,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.primaryHintColorLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              InputWidget(
                hint: 'input_name'.tr,
                lable: 'name'.tr,
              ),
              const SizedBox(height: 16),
              InputWidget(
                hint: 'input_phone'.tr,
                lable: 'phone'.tr,
              ),
              const SizedBox(height: 16),
              InputWidget(
                hint: 'input_private_id'.tr,
                lable: 'private_id'.tr,
              ),
              const SizedBox(height: 16),
              InputWidget(
                hint: 'input_email'.tr,
                lable: 'email'.tr,
              ),
              const SizedBox(height: 32),
              AppGradientButton(
                onPressed: () {
                  // print();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'confirm'.tr,
                    style: TextStyle(
                      color: AppColor.secondTextColorLight,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // print()
                },
                child: Text(
                  'enter_late'.tr,
                  style: TextStyle(
                    color: AppColor.primaryColorLight,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
