import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';

import '../../../data/repository/api_repository.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class MotoRescueCheckoutController extends BaseController {
  MotoRescueCheckoutController({required this.apiRepository});

  final ApiRepository apiRepository;

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  void onBuyNowButtonPressed() {
    Get.toNamed(Routes.MOTO_INSURANCE_SCREEN);
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
