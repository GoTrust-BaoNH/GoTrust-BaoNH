import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/your_product/controller/your_product_controller.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/tabs/custom_tab.dart';
import 'package:go_trust/shared/widgets/title_widget/title_base_widget.dart';
import 'package:gotrust_repository_data/shared/models/product/product_enum.dart';
import 'package:gotrust_repository_data/shared/models/product/your_product_model.dart';
import 'package:intl/intl.dart';

part 'your_product_children.dart';

class YourProductScreen extends GetView<YourProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBase(
            context,
            title: 'your_product'.tr,
            color: AppColor.textBlack,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
          ),
          _buildHorizontalTabs,
          Expanded(
            child: _listProduct(
              onItemPressed: (item) {},
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.white,
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const FCoreImage(
                    ImageConstants.appIcon,
                    height: 48,
                    width: 48,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
