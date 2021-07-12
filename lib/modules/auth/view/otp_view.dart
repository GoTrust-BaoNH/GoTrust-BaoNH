import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/widgets/button/secondary_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class OtpScreen extends GetView<AuthController> {
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
                  'input_otp'.tr,
                  style: TextAppStyle().titlePageTextStyle(),
                ),
                const SizedBox(height: 12),
                Text(
                  'sent_otp_to_phone'.tr,
                  style: TextAppStyle().contentPageTextStyle(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                InputWidget(
                  hint: 'input_otp_code'.tr,
                  lable: 'verify_code'.tr,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.AUTH + Routes.CREATE_PASSWORD_SCREEN);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'not_received_otp'.tr,
                          style: TextAppStyle().contentPageTextStyle(),
                        ),
                        TextSpan(
                          text: 'resend_otp'.tr,
                          style: TextAppStyle().textClickColorStyle(),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 32),
                SecondaryButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'return'.tr,
                    style: TextAppStyle().textDisableButtonStyle(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )),
    );
  }
}
