import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class LoginPinScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40, width: width),
                FCoreImage(
                  ImageConstants.appIcon,
                  width: width * 0.36,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 30),
                Text(
                  'Nhập mã PIN',
                  style: TextAppStyle().titlePageTextStyle(),
                ),
                const SizedBox(height: 12),
                Text(
                  'Mã PIN',
                  style: TextAppStyle().contentPageTextStyle(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                InputWidget(
                  hint: 'Nhập mã PIN',
                  lable: 'Mã PIN',
                  controller: controller.inputPinController,
                ),
                const SizedBox(height: 32),
                AppGradientButton(
                  onPressed: () {
                    controller.loginWithPin();
                  },
                  child: Text(
                    'confirm'.tr,
                    style: TextAppStyle().textEnableButtonStyle(),
                  ),
                ),
                const SizedBox(height: 16),
                if (controller.isUseBiometric() == true)
                  AppGradientButton(
                    onPressed: () {
                      controller.loginWithBiometric();
                    },
                    child: Text(
                      'Mở khóa bằng sinh trắc học',
                      style: TextAppStyle().textEnableButtonStyle(),
                    ),
                  ),
                const SizedBox(height: 16),
              ],
            ),
          )),
    );
  }
}
