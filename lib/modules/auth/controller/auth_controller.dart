import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_api.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/storage.dart';
import 'package:go_trust/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/models/request/login_request.dart';
import 'package:go_trust/shared/utils/focus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/api_repository.dart';

class AuthController extends BaseController {
  AuthController({required this.apiRepository});

  final ApiRepository apiRepository;
  String qrCodeResult = '';

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  Future<void> loginWithGoogle(BuildContext context) async {
    AppFocus.unFocus(context);

    final res = await apiRepository.login(
      LoginType.Google,
      LoginRequest(
        username: '',
        password: '',
      ),
    );

    if (res == null) {
      await EasyLoading.dismiss();
      await callDialogErrorNetwork();
      return;
    }

    final prefs = Get.find<SharedPreferences>();
    if (res.token.isNotEmpty) {
      await prefs.setString(StorageConstants.token, res.token);
      await prefs.setString(StorageConstants.userId, '');
      await Get.offAndToNamed(Routes.HOME);
    }
  }

  Future<void> loginWithFacebook(BuildContext context) async {
    AppFocus.unFocus(context);

    final res = await apiRepository.login(
      LoginType.Facebook,
      LoginRequest(
        username: '',
        password: '',
      ),
    );

    if (res == null) {
      await EasyLoading.dismiss();
      await callDialogErrorNetwork();
      return;
    }

    final prefs = Get.find<SharedPreferences>();
    if (res.token.isNotEmpty) {
      await prefs.setString(StorageConstants.token, res.token);
      await prefs.setString(StorageConstants.userId, '');
      await Get.offAndToNamed(Routes.HOME);
    }
  }

  Future<void> loginWithApple(BuildContext context) async {
    AppFocus.unFocus(context);

    final res = await apiRepository.login(
      LoginType.Apple,
      LoginRequest(
        username: '',
        password: '',
      ),
    );

    if (res == null) {
      await EasyLoading.dismiss();
      await callDialogErrorNetwork();
      return;
    }

    final prefs = Get.find<SharedPreferences>();
    if (res.token.isNotEmpty) {
      await prefs.setString(StorageConstants.token, res.token);
      await prefs.setString(StorageConstants.userId, '');
      await Get.offAndToNamed(Routes.HOME);
    }
  }

  Future<void> scanQRCode() async {
    try {
      qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#FFFB6107',
        'Cancel',
        true, //show flash icon
        ScanMode.QR,
      );
    } on PlatformException {
      qrCodeResult = 'Failed to get platform version.';
    }
  }

  // ignore: unused_element
  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      await _handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  Future<void> _handleEventDialog(String? defineEvent) async {
    switch (defineEvent) {
      default:
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
