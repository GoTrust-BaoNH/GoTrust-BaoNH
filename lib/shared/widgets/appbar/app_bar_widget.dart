import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/styles/text_style/text_style.dart';

PreferredSizeWidget appbar(BuildContext context, {String title = APP_NAME}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        fontFamily: TextAppStyle.appFont,
        color: Colors.white,
      ),
    ),
    brightness: Brightness.dark,
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColor.color45C152,
            AppColor.color0ADC90,
          ],
        ),
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(Routes.NOTIFICATION_SCREEN);
        },
      ),
      IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Get.toNamed(Routes.YOUR_PRODUCT_SCREEN);
        },
        color: Colors.white,
      ),
    ],
  );
}
