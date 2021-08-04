import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class VoucherController extends BaseController {
  VoucherController({required this.apiRepository});

  final Infrastructure apiRepository;

  final TextEditingController textController = TextEditingController();
  String qrCodeResult = '';

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  Future<void> scanQRCode() async {
    try {
      // qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
      //   '#FFFB6107',
      //   'Cancel',
      //   false, //show flash icon
      //   ScanMode.QR,
      // );
    } on PlatformException {
      qrCodeResult = 'Failed to get platform version.';
    }
  }

  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  void handleEventDialog(String? defineEvent) {
    switch (defineEvent) {
      case NO_CONNECT_NETWORK:
        checkConnectNetwork();
        break;
      default:
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
