import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/borrow_data/controller/borrow_data_controller.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';

part 'borrow_data_screen.children.dart';

class BorrowDataScreen extends GetView<BorrowDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'borrow_data'.tr,
                style: TextAppStyle().titlePageTextStyle(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'your_phone'.tr,
                style: TextAppStyle().contentPage2TextStyle(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: customTextField(controller: TextEditingController()),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: AppGradientButton(
                onPressed: controller.onBorrowDataPressed,
                child: Text(
                  'borrow_value_data'.trParams({'value': '1'}),
                  style: TextAppStyle().textEnableButtonStyle(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: greyButton(
                onPressed: () {},
                title: 'borrow_value_call'.trParams({'value': '10'}),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: greyButton(
                onPressed: () {},
                title: 'recharge_with'.trParams({'appName': APP_NAME}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
