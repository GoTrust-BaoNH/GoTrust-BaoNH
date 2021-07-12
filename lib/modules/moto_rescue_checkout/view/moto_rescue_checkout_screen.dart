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
                'motorbike_rescue'.tr,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const StepWidget(currentStepIndex: 1),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 16),
              child: Text(
                'confirm_information'.tr,
                style: Theme.of(context).accentTextTheme.bodyText2,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputWidget(
                      hint: 'input_name_owner_vehicle'.tr,
                      lable: 'name_owner_vehicle'.tr,
                    ),
                    const SizedBox(height: 16),
                    InputWidget(
                      hint: 'input_phone'.tr,
                      lable: 'phone'.tr,
                    ),
                    const SizedBox(height: 16),
                    InputWidget(
                      hint: 'input_license_plates'.tr,
                      lable: 'license_plates'.tr,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            AppGradientButton(
              onPressed: controller.onBuyNowButtonPressed,
              child: Text(
                'buy_now'.tr,
                style: Theme.of(context).accentTextTheme.headline6,
              ),
            ),
            const SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
