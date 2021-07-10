import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/voucher/controller/voucher_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/styles/text_style.dart';
import 'package:go_trust/shared/theme/theme_color.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/title_widget/title_base_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

part 'voucher_children.dart';

part 'voucher_action.dart';

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
                title: 'Nhập mã khuyến mãi',
                color: AppThemeColor.textBlack,
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
                  'Xác nhận',
                  style: TextStyle(
                    color: AppColor.secondTextColorLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Hoặc',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: AppThemeColor.gray1,
                    fontFamily: TextAppStyle.appFont,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildQRCodeButton(
                onQRButtonPressed: scanQRCode,
              ),
              const SizedBox(height: 16),
              _buildGetVoucherButton(
                onButtonPressed: () {},
              ),
              const SizedBox(height: 16),
              const Text(
                'Mã khuyến mại hoặc QR Code được cung cấp\n'
                'trong các chương trình khuyến mãi của chúng tôi',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: AppThemeColor.gray1,
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
