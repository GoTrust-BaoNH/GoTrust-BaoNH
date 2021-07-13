part of '../text_style.dart';

extension PaymentPageStyle on TextAppStyle {
  TextStyle textTitlePagePaymentStyle() {
    return TextStyle(
      color: AppColor.fourthTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textTitleItemPaymentStyle() {
    return TextStyle(
      color: AppColor.sixTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textBankNamePaymentStyle() {
    return TextStyle(
      color: AppColor.sevenTextColorLight,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textContentPagePaymentStyle() {
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }
}
