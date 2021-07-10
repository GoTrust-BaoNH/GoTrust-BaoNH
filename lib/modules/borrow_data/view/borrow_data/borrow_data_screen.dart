
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/borrow_data/controller/borrow_data_controller.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';

part 'borrow_data_screen.action.dart';
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
                'Ứng data 4G',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Số điện thoại của bạn',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: customTextField(controller: TextEditingController()),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: AppGradientButton(
                onPressed: onBorrowDataPressed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Ứng ngay 1GB data',
                    style: TextStyle(
                      color: AppColor.secondTextColorLight,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: greyButton(
                onPressed: () {},
                title: 'Ứng ngay 10 phút gọi thoại',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: greyButton(
                onPressed: () {},
                title: 'Nạp tiền bằng Go Trust',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
