import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/shared/constants/colors.dart';

class TextAppStyle {
  static const String appFont = 'Mulish';

  TextStyle titleTextStyle() {
    return Get.theme.textTheme.headline6!;
  }

  TextStyle bodyContentTextStyle() {
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle versionTextStyle() {
    return TextStyle(
      color: AppColor.primaryTextColorLight.withOpacity(0.5),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle versionContentTextStyle() {
    return TextStyle(
      color: AppColor.primaryTextColorLight,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle bodyTitleTextStyle() {
    return Get.theme.textTheme.headline5!;
  }

  TextStyle bodyWhiteTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  TextStyle prefixDesignTextStyle() {
    return TextStyle(
      color: Get.theme.textTheme.headline3!.color,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  TextStyle suffixDesignTextStyle() {
    return TextStyle(
      color: Get.theme.primaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }
}
