import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

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
                'Nhập thông tin cá nhân',
                style: TextStyle(
                  color: AppColor.primaryTextColorLight,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Nhập các thông tin sau',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.primaryHintColorLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'giúp bạn mua sắm sản phẩm nhanh hơn',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColor.primaryHintColorLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const InputWidget(
                hint: 'Nhập họ và tên',
                lable: 'Họ và tên',
              ),
              const SizedBox(height: 16),
              const InputWidget(
                hint: 'Nhập số điện thoại',
                lable: 'Số điện thoại',
              ),
              const SizedBox(height: 16),
              const InputWidget(
                hint: 'Nhập số CMND / CCCD',
                lable: 'Số CMND / CCCD',
              ),
              const SizedBox(height: 16),
              const InputWidget(
                hint: 'Nhập email',
                lable: 'Email',
              ),
              const SizedBox(height: 32),
              AppGradientButton(
                onPressed: () {
                  // print();
                },
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
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // print()
                },
                child: Text(
                  'Nhập sau',
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
