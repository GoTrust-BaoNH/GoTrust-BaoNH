import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class LoginScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
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
                      'hello'.tr,
                      style: TextAppStyle().titlePageTextStyle(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'login_for_use_app'.tr,
                      style: TextAppStyle().contentPageTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    InputWidget(
                      hint: 'input_your_phone'.tr,
                      lable: 'phone'.tr,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 32),
                    AppGradientButton(
                      onPressed: () {
                        Get.toNamed(Routes.AUTH + Routes.OTP_SCREEN);
                      },
                      child: Text(
                        'login'.tr,
                        style: TextAppStyle().textEnableButtonStyle(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          '${'login_other'.tr} :',
                          style: TextAppStyle().contentPageTextStyle(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(Routes.AUTH + Routes.QRCODE_SCREEN);
                            controller.scanQRCode();
                          },
                          child: const FCoreImage(IconConstants.qr),
                        ),
                        const SizedBox(width: 23),
                        const FCoreImage(IconConstants.facebook),
                        const SizedBox(width: 23),
                        const FCoreImage(IconConstants.google),
                        const SizedBox(width: 23),
                        const FCoreImage(IconConstants.apple),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  child: Text(
                    'skip_login'.tr,
                    style: TextAppStyle().textClickColorStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
