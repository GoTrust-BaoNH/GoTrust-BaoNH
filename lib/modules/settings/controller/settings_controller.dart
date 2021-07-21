import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/constants/storage.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:local_auth/local_auth.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/api_repository.dart';

class SettingsController extends BaseController {
  SettingsController({required this.apiRepository});

  final ApiRepository apiRepository;

  final LocalAuthentication auth = LocalAuthentication();
  final storage = Get.find<SharedPreferences>();
  var isUseBiometric = false.obs;

  @override
  Future<void> onInit() async {
    isUseBiometric.value = storage.getBool(StorageConstants.use_biometric) ?? false;
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> changeSettingBiometric() async {
    final canCheckBiometrics = await auth.canCheckBiometrics;

    if (!canCheckBiometrics) {
      showError(content: 'Thiết bị không hỗ trợ sinh trắc học');
      return;
    }

    isUseBiometric.value = !isUseBiometric.value;
    await storage.setBool(StorageConstants.use_biometric, isUseBiometric.value);
  }

  Future<void> changeLanguage() async {
    final prefs = Get.find<SharedPreferences>();
    final language = prefs.getString(StorageConstants.language);
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showLanguageDialog(
      languages: const [VIETNAMESE_LANG, ENGLISH_LANG],
      isMustTapButton: true,
    );

    if (language != null && language == dialogResult.language) {
      return;
    }

    if (dialogResult.language == VIETNAMESE_LANG) {
      Get.updateLocale(const Locale('vi', 'VN'));
    }

    if (dialogResult.language == ENGLISH_LANG) {
      Get.updateLocale(const Locale('en', 'US'));
    }

    await prefs.setString(StorageConstants.language, dialogResult.language);
  }

  Future<void> confirmLogout() async {
    await storage.setBool(StorageConstants.use_biometric, false);
    await storage.setString(StorageConstants.token, '');
    await storage.setString(StorageConstants.pin, '');

    await Get.offAllNamed(Routes.AUTH);
  }

  Future<void> shareApp() async {
    await Share.share('download app android $URL_ANDROID \ndownload app ios $URL_IOS');
  }

  void showError({required String content}) {
    Get.snackbar(
      'error'.tr,
      content,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
