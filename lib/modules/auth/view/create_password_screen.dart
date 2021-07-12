import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class CreatePasswordScreen extends GetView<AuthController> {
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
                  'create_password'.tr,
                  style: TextAppStyle().titlePageTextStyle(),
                ),
                const SizedBox(height: 12),
                Text(
                  'please_setup_password'.tr,
                  style: TextAppStyle().contentPageTextStyle(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                InputWidget(
                  hint: 'input_new_password'.tr,
                  lable: 'password'.tr,
                ),
                const SizedBox(height: 32),
                AppGradientButton(
                  onPressed: () {
                    Get.toNamed(Routes.AUTH + Routes.USER_INFO_SCREEN);
                  },
                  child: Text(
                    'confirm'.tr,
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
