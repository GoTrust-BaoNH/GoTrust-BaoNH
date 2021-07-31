import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/models/product/product_model.dart';
import 'package:go_trust/shared/network/constants/constants.dart';

import '../../../data/repository/api_repository.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class OtoRescueBuyController extends BaseController {
  OtoRescueBuyController({required this.apiRepository});

  final ApiRepository apiRepository;

  late List<ProductModel> listProduct;
  var listProductDisplay = <ProductModel>[].obs;

  @override
  Future<void> onInit() async {
    await getRecuseOtoProduct();
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  Future<void> getRecuseOtoProduct() async {
    await EasyLoading.show();
    await apiRepository.getRecuseCarProduct().then(
      (result) async {
        await EasyLoading.dismiss();
        if (result.isNotEmpty) {
          listProduct = result;
          listProductDisplay.value = listProduct;
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

  void onBuyNowButtonPressed() {
    Get.toNamed(Routes.OTO_RESCUE_CHECKOUT_SCREEN);
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
