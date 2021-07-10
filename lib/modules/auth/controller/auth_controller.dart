import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import '../../../data/repository/api_repository.dart';

class AuthController extends BaseController {
  AuthController({required this.apiRepository});

  final ApiRepository apiRepository;

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  Future<void> login(BuildContext context) async {

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