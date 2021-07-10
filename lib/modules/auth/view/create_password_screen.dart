import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class CreatePasswordScreen extends GetView<AuthController> {
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
                SizedBox(height: 40, width: width),
                FCoreImage(
                  ImageConstants.appIcon,
                  width: width * 0.36,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 30),
                Text(
                  'Tạo mật khẩu',
                  style: TextStyle(
                    color: AppColor.primaryTextColorLight,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Vui lòng cài mật khẩu cho tài khoản của bạn',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.primaryHintColorLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const InputWidget(
                  hint: 'Nhập mật khẩu mới',
                  lable: 'Mật khẩu',
                ),
                const SizedBox(height: 32),
                AppGradientButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Xác nhận',
                      style: TextStyle(
                        color: AppColor.secondTextColorLight,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          )),
    );
  }
}
