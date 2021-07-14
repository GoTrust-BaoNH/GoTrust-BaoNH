import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/constants/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await loadInitSplashScreen();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  Future<void> loadInitSplashScreen() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final storage = Get.find<SharedPreferences>();
    _loadLanguage(storage);
    _loadTheme(storage);
    try {
      if (storage.getString(StorageConstants.token) != null) {
        print('Token: ${storage.getString(StorageConstants.token)}');
        await Get.offAndToNamed(Routes.HOME);
      } else {
        await Get.offAndToNamed(Routes.AUTH);
      }
    } catch (e) {
      await Get.toNamed(Routes.AUTH);
    }
  }

  void _loadLanguage(SharedPreferences storage) {
    final language = storage.getString(StorageConstants.language);
    if (language == null) {
      Get.updateLocale(const Locale('vi', 'VN'));
      storage.setString(StorageConstants.language, VIETNAMESE_LANG);
      return;
    }

    if (language == VIETNAMESE_LANG) {
      Get.updateLocale(const Locale('vi', 'VN'));
      return;
    }

    Get.updateLocale(const Locale('en', 'US'));
  }

  void _loadTheme(SharedPreferences storage) {
    final theme = storage.getString(StorageConstants.theme);
    if (theme == null || theme == LIGHT_THEME) {
      Get.changeThemeMode(ThemeMode.light);
      storage.setString(StorageConstants.theme, LIGHT_THEME);
      return;
    }

    Get.changeThemeMode(ThemeMode.dark);
    storage.setString(StorageConstants.theme, DARK_THEME);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
