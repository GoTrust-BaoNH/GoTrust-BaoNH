import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import 'package:gotrust_repository_data/shared/models/emergency/emergency_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class EmergencyController extends BaseController {
  EmergencyController({required this.apiRepository});

  final Infrastructure apiRepository;

  var emergencyList = <EmergencyModel>[].obs;

  final int pageSize = 10;
  var pageNumber = 0.obs;

  final ScrollController scrollController = ScrollController();
  bool canLoadingMore = true;

  @override
  Future<void> onInit() async {
    await getListEmergency();
    await super.onInit();
  }

  Future<void> getListEmergency() async {
    await EasyLoading.show();
    await apiRepository.getEmergencyList(pageNumber: pageNumber.value, pageSize: pageSize).then(
      (result) async {
        await EasyLoading.dismiss();
        if (result.data != null) {
          if (result.data!.length < pageSize) {
            canLoadingMore = false;
          }
          emergencyList.value.addAll(result.data!);
          emergencyList.refresh();
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

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  void notificationButtonPressed() {}

  void menuButtonPressed() {}

  Future<void> onItemListServicePressed(EmergencyModel item) async {
    final url = 'tel:${item.phone}';
    final canCall = await canLaunch(url);
    if (canCall) {
      await launch(url);
    } else {
      showError(content: 'not support');
    }
  }

  void onChatButtonPressed() {}

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

  void showError({required String content}) {
    Get.snackbar(
      'error'.tr,
      content,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
