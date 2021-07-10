import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/moto_rescue_checkout/controller/moto_rescue_checkout_controller.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/step_widget/step_widget.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

part 'moto_rescue_checkout.children.dart';

class MotoRescueCheckoutScreen extends GetView<MotoRescueCheckoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Cứu hộ xe máy 24/7',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const StepWidget(currentStepIndex: 1),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 16),
              child: Text(
                'Vui lòng xác nhận thông tin',
                style: Theme.of(context).accentTextTheme.bodyText2,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    InputWidget(
                      hint: 'Nhập họ và tên chủ xe',
                      lable: 'Họ và tên chủ xe',
                    ),
                    SizedBox(height: 16),
                    InputWidget(
                      hint: 'Nhập số điện thoại',
                      lable: 'Số điện thoại',
                    ),
                    SizedBox(height: 16),
                    InputWidget(
                      hint: 'Nhập số xe',
                      lable: 'Biển số xe',
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            AppGradientButton(
              onPressed: controller.onBuyNowButtonPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Mua ngay',
                  style: Theme.of(context).accentTextTheme.headline2,
                ),
              ),
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
