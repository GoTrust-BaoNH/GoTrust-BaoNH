import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/colors.dart';
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
                    Text('Xin chào', style: Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 12),
                    Text(
                      'Đăng nhập để sử dụng đầy đủ tính năng của ứng dụng',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.primaryHintColorLight,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    const InputWidget(
                      hint: 'Nhập số điện thoại của bạn',
                      lable: 'Số điện thoại',
                      inputType: TextInputType.number,
                    ),
                    const SizedBox(height: 32),
                    AppGradientButton(
                      onPressed: () {
                        // Get.toNamed(Routes.AUTH + Routes.USER_INFO_SCREEN);
                        Get.toNamed(Routes.BORROW_DATA_SCREEN);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                            color: AppColor.secondTextColorLight,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Hoặc đăng nhập bằng: ',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColor.primaryHintColorLight,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: (){
                            // Get.toNamed(Routes.AUTH + Routes.QRCODE_SCREEN);
                          },
                          child: const FCoreImage(IconConstants.qr),
                        ),
                        const SizedBox(width: 10),
                        const FCoreImage(IconConstants.facebook),
                        const SizedBox(width: 10),
                        const FCoreImage(IconConstants.google),
                        const SizedBox(width: 10),
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
                    'Bỏ qua đăng nhập',
                    style: TextStyle(
                      color: AppColor.primaryColorLight,
                      fontSize: 14,
                    ),
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
