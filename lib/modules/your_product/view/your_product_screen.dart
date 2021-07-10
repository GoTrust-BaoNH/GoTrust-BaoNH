import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/your_product/controller/your_product_controller.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/models/product/product_enum.dart';
import 'package:go_trust/shared/models/product/product_model.dart';
import 'package:go_trust/shared/styles/text_style.dart';
import 'package:go_trust/shared/theme/theme_color.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/tabs/custom_tab.dart';
import 'package:go_trust/shared/widgets/title_widget/title_base_widget.dart';
import 'package:intl/intl.dart';

part 'your_product_children.dart';

class BorrowDataScreen extends GetView<YourProductController> {
  List<YourProductModel> list = [
    YourProductModel(
      productType: ProductEnum.MotoInsurrance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().add(const Duration(days: 10)).toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MedicalOnline,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().toString(),
    ),
    YourProductModel(
      productType: ProductEnum.OnlineShopping,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      isContractProcessing: true,
      expiredDate: DateTime.now().add(const Duration(days: 10)).toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoRescue,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      isContractProcessing: true,
      expiredDate: DateTime.now().toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoInsurrance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoInsurrance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().add(const Duration(days: 10)).toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoInsurrance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().toString(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBase(
            context,
            title: 'Sản phẩm của bạn',
            color: AppThemeColor.textBlack,
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
