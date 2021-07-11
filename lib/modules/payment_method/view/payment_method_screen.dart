import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/payment_method/controller/payment_method_controller.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/payment_widget/payment_method_item.dart';
import 'package:go_trust/shared/widgets/step_widget/step_widget.dart';

class PaymentMethodScreen extends GetView<PaymentMethodController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                'motorbike_rescue'.tr,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            const StepWidget(currentStepIndex: 2),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 12),
              child: Text(
                'choose_payment_method'.tr,
                style: Theme.of(context).accentTextTheme.bodyText2,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: controller.viewModel.length,
                itemBuilder: (context, index) => PaymentMethodItem(
                  viewModel: controller.viewModel[index],
                  isSelected: controller.currentMethod == index,
                  onChange: () {
                    // setState(() {
                    //   _currentMethod = index;
                    // });
                  },
                ),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 16),
              ),
            ),
            const SizedBox(height: 16),
            AppGradientButton(
              onPressed: controller.onNextButtonPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'next'.tr,
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
