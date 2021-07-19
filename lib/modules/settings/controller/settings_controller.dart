import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/storage.dart';
import 'package:local_auth/local_auth.dart';
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

  Future<void> confirmLogout() async {
    await storage.setBool(StorageConstants.use_biometric, false);
    await storage.setString(StorageConstants.token, '');
    await storage.setString(StorageConstants.pin, '');

    await Get.offAllNamed(Routes.AUTH);
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
