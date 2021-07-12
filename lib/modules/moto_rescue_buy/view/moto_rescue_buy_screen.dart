import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/moto_rescue_buy/controller/moto_rescue_buy_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/methods/common_method.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/step_widget/step_widget.dart';
import 'package:go_trust/shared/widgets/tabs/custom_tab.dart';

part 'moto_rescue_buy.children.dart';

class MotoRescueBuyScreen extends GetView<MotoRescueBuyController> {
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
              const StepWidget(currentStepIndex: 0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 16,
                  ),
                  child: CustomTab(
                    items: [
                      'car_below'.trParams({'value': '175'})!,
                      'motorcycle_on'.trParams({'value': '175'})!,
                    ],
                    activeItemDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xff83DCA7).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: ThemeDecoration.textFieldWithShadow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${'membership_fee'.tr}: ',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            TextSpan(
                              text: formatVnd(controller.viewModel.price.toString()),
                              style: Theme.of(context).accentTextTheme.headline3,
                            ),
                            TextSpan(
                              text: ' / ${'year'.tr}',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List<Widget>.generate(
                              controller.viewModel.items.length,
                              (index) => rescueDetailItem(
                                  icon: FCoreImage(controller.viewModel.items[index].icon),
                                  title: controller.viewModel.items[index].title,
                                  value: controller.viewModel.items[index].value,
                                  type: controller.viewModel.items[index].type),
                            ),
                          ),
                        ),
                      ),
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
          )),
    );
  }
}
