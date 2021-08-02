import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';

import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class MotoInsuranceController extends BaseController {
  MotoInsuranceController({required this.apiRepository});

  final ApiRepository apiRepository;

  final PageController pageController = PageController();

  var motoInsInfo = ''.obs;

  @override
  Future<void> onInit() async {
    await getMotoInsuranceInfo();
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  Future<void> getMotoInsuranceInfo() async {
    await EasyLoading.show();
    await apiRepository.getMotoInsMetaData(partner: 'hdi').then(
      (result) async {
        await EasyLoading.dismiss();
        if (result.isNotEmpty) {
          motoInsInfo.value = result;
        } else {
          final dialogRequest = CommonDialogRequest(
            title: 'error'.tr,
            description: 'unknown_error'.tr,
            typeDialog: DIALOG_ONE_BUTTON,
            defineEvent: 'unknown_error',
          );
          await _doShowDialog(dialogRequest);
        }
      },
      onError: (e) async {
        await EasyLoading.dismiss();
        await _doShowDialog(handleErrorResponse(e));
      },
    );
  }

  Future<void> onBuyButtonPressed() async {
    await EasyLoading.show();
    await apiRepository.createMotorInsOrder(amount: 1000000, startDate: '23/07/2021', expDate: '23/07/2022', partner: 'hdi', productId: 'baohiemxemay').then(
      (result) async {
        await EasyLoading.dismiss();
        if (result.status == 1 && result.orderId != null) {
          CommonConstants.orderID = result.orderId!;
          await Get.toNamed(Routes.PAYMENT_METHOD_SCREEN);
        } else {
          final dialogRequest = CommonDialogRequest(
            title: 'error'.tr,
            description: 'unknown_error'.tr,
            typeDialog: DIALOG_ONE_BUTTON,
            defineEvent: 'unknown_error',
          );
          await _doShowDialog(dialogRequest);
        }
      },
      onError: (e) async {
        await EasyLoading.dismiss();
        await _doShowDialog(handleErrorResponse(e));
      },
    );
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
      case Unknown_Error:
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
