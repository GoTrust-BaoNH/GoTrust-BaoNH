import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/voucher/controller/voucher_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/title_widget/title_base_widget.dart';

part 'voucher_children.dart';

class EmergencyScreen extends GetView<VoucherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: GestureDetector(
        onTap: () {
          // Hide keyboard
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleBase(
                context,
                title: 'input_promo_code'.tr,
                color: AppColor.textBlack,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
              ),
              // ignore: flutter_style_todos
              //TODO: Waiting design here
              const SizedBox(height: 120),
              _buildInputVoucher(),
              const SizedBox(height: 32),
              AppGradientButton(
                onPressed: () {},
                child: Text(
                  'confirm'.tr,
                  style: TextStyle(
                    color: AppColor.secondTextColorLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'or'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: AppColor.gray1,
                    fontFamily: TextAppStyle.appFont,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildQRCodeButton(
                onQRButtonPressed: controller.scanQRCode,
              ),
              const SizedBox(height: 16),
              _buildGetVoucherButton(
                onButtonPressed: () {},
              ),
              const SizedBox(height: 16),
              Text(
                'promo_or_qr_code'.tr,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: AppColor.gray1,
                  fontFamily: TextAppStyle.appFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
