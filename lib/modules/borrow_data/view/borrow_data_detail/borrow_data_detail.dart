import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/borrow_data/controller/borrow_data_controller.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/methods/common_method.dart';
import 'package:go_trust/shared/models/data_package/data_package_model.dart';
import 'package:go_trust/shared/models/data_package/data_package_model_mock.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';

part 'borrow_data_detail.children.dart';

class BorrowDataDetailScreen extends GetView<BorrowDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appbar(context),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      'borrow_data'.tr,
                      style: TextAppStyle().titlePage2TextStyle(),
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
                    margin: const EdgeInsets.only(top: 8, bottom: 16),
                    child: customTextField(
                      controller: TextEditingController(),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dataPackagesModelListFromRawJson(
                        dataPackageModel,
                      ).length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 22),
                        child: dataPackagesList(
                            data: dataPackagesModelListFromRawJson(
                          dataPackageModel,
                        )[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${'paid_amount'.tr}: ',
                      style: TextAppStyle().titlePriceColorStyle(),
                    ),
                    Text(
                      '50000 VNĐ',
                      style: TextAppStyle().textPriceColorStyle(),
                    ),
                  ],
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
                    'confirm'.tr,
                    style: TextAppStyle().textEnableButtonStyle(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
