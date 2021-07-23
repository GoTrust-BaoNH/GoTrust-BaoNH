import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/moto_insurance/controller/moto_insurance_controller.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/step_widget/step_widget.dart';
import 'package:go_trust/shared/widgets/tabs/custom_tab.dart';
import 'package:go_trust/shared/widgets/title_widget/title_base_widget.dart';

part 'moto_insurance_children.dart';

class MotoInsuranceScreen extends GetView<MotoInsuranceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBase(
            context,
            title: 'moto_insurance'.tr,
            color: AppColor.textBlack,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: StepWidget(currentStepIndex: 2),
          ),
          const SizedBox(height: 24),
          Obx(
            () => Expanded(
              child: Html(data: controller.motoInsInfo.value),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            child: AppGradientButton(
              onPressed: controller.onBuyButtonPressed,
              child: Text(
                'buy_now'.tr,
                style: TextStyle(
                  color: AppColor.secondTextColorLight,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
