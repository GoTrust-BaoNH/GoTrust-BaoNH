import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/payment_info/controller/payment_info_controller.dart';
import 'package:go_trust/shared/methods/common_method.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class PaymentInfoScreen extends GetView<PaymentInfoController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: appbar(context),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'info_payment'.tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputWidget(
                        hint: 'input_card_holder'.tr,
                        lable: 'card_holder'.tr,
                      ),
                      const SizedBox(height: 16),
                      InputWidget(
                        hint: 'input_card_number'.tr,
                        lable: 'card_number'.tr,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: InputWidget(
                              hint: 'input_cvv'.tr,
                              lable: 'cvv'.tr,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: InputWidget(
                              hint: '${'month'.tr} / ${'year'.tr}',
                              lable: 'expired_date'.tr,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 12),
                        child: Text(
                          'content_billing'.tr,
                          style: TextAppStyle().textTitlePagePaymentStyle(),
                        ),
                      ),
                      Container(
                        width: Get.width,
                        decoration: ThemeDecoration.textFieldWithShadow,
                        padding: const EdgeInsets.only(
                          top: 12,
                          right: 12,
                          left: 12,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              controller.paymentDescription,
                              style: TextAppStyle().textContentPagePaymentStyle(),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${'payment_amount'.tr}: ',
                                    style: TextAppStyle().textContentPagePaymentStyle(),
                                  ),
                                  TextSpan(
                                    text: formatVnd(controller.price.toString()),
                                    style: TextAppStyle().textTitlePagePaymentStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AppGradientButton(
                onPressed: () {
                  controller.onConfirmButtonPressed();
                },
                child: Text(
                  'confirm'.tr,
                  style: Theme.of(context).accentTextTheme.headline6,
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
