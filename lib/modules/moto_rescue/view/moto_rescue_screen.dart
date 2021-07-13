import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/moto_rescue/controller/moto_rescue_controller.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';

part 'moto_rescue.children.dart';

class MotoRescueScreen extends GetView<MotoRescueController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar(context),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
            Visibility(
              visible: Get.width / Get.height > 16 / 9,
              child: const Center(
                child: FCoreImage(
                  ImageConstants.recueMotoImage,
                  // width: device.width * 0.8,
                  height: 140,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 0),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                ),
                itemBuilder: (context, index) {
                  return containerItem(
                    icon: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.redPrimary.withOpacity(0.2),
                      ),
                      child: const FCoreImage(
                        IconConstants.repair,
                        color: AppColor.redPrimary,
                      ),
                    ),
                    title: 'fix_lock_problem'.tr,
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 20,
              ),
              child: AppGradientButton(
                onPressed: () {},
                child: Text(
                  'call_operator'.tr,
                  style: Theme.of(context).accentTextTheme.headline6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
