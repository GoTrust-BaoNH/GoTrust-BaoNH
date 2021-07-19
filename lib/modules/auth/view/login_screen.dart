import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/common/define_api.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/modules/qrcode/view/qr_view_screen.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
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
                      controller: controller.phoneController,
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 32),
                    AppGradientButton(
                      onPressed: () {
                        controller.registerOTP();
                      },
                      child: Text(
                        'login'.tr,
                        style: TextAppStyle().textEnableButtonStyle(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${'login_other'.tr} :',
                          style: TextAppStyle().contentPageTextStyle(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 15),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(QRViewScreen())!.then((value) {
                              if (value != null) {
                                print('Barcode Type: ${describeEnum(value!.format)}   Data: ${value!.code}');
                              }
                            });
                          },
                          child: const FCoreImage(IconConstants.qr),
                        ),
                        const SizedBox(width: 23),
                        GestureDetector(
                          onTap: () {
                            controller.loginWithSocial(context, LoginType.Facebook);
                          },
                          child: const FCoreImage(IconConstants.facebook),
                        ),
                        const SizedBox(width: 23),
                        GestureDetector(
                          onTap: () {
                            controller.loginWithSocial(context, LoginType.Google);
                          },
                          child: const FCoreImage(IconConstants.google),
                        ),
                        const SizedBox(width: 23),
                        !Platform.isAndroid
                            ? GestureDetector(
                                onTap: () {
                                  controller.loginWithSocial(context, LoginType.Apple);
                                },
                                child: const FCoreImage(IconConstants.apple),
                              )
                            : Container(),
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
