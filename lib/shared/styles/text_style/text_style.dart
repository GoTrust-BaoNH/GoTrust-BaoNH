import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/shared/constants/colors.dart';

part 'borrow_data_page/borrow_data_text_style.dart';
part 'home_page/home_page_text_style.dart';
part 'moto_page/moto_page_text_style.dart';
part 'payment_page/payment_page_text_style.dart';

/// Define color at theme_data.dart
class TextAppStyle {
  static const String appFont = 'Mulish';

  TextStyle versionTextStyle() {
    return Get.theme.textTheme.headline5!;
  }

  TextStyle versionContentTextStyle() {
    /// headline2 Color: secondTextColor -> White
    /// headline2: baseTextTheme.headline2!.copyWith(
    ///   color: secondTextColor,
    ///   fontSize: 20,
    ///  fontWeight: FontWeight.bold,
    /// ),
    return Get.theme.textTheme.headline2!;
  }

  TextStyle textEnableButtonStyle() {
    /// headline2 Color: secondTextColor -> White
    return TextStyle(
      color: Get.theme.textTheme.headline2!.color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle textDisableButtonStyle() {
    /// headline4 Color: fourthTextColor -> Green
    return TextStyle(
      color: Get.theme.textTheme.headline4!.color,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle labelTextFormFieldStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle hintTextFormFieldStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textInputFormFieldStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle titlePageTextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle titlePage2TextStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle contentPageTextStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color,
      fontSize: 13,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle contentPage2TextStyle() {
    /// headline5 Color: fifthTextColor -> Gray
    return TextStyle(
      color: Get.theme.textTheme.headline5!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle textClickColorStyle() {
    /// headline4 Color: fourthTextColor -> Green
    return TextStyle(
      color: Get.theme.textTheme.headline4!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle titleQrCodeColorStyle() {
    /// headline2 Color: secondTextColor -> White
    return TextStyle(
      color: Get.theme.textTheme.headline2!.color,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textPriceColorStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle titlePriceColorStyle() {
    /// headline1 Color: primaryTextColor -> Black Gray (#333333)
    return TextStyle(
      color: Get.theme.textTheme.headline1!.color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat',
    );
  }

  TextStyle textAppBarColorStyle() {
    /// headline2 Color: secondTextColor -> White
    return TextStyle(
      color: Get.theme.textTheme.headline2!.color,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    );
  }
}
