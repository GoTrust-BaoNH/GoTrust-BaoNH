import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import 'package:gotrust_repository_data/shared/models/product/product_model.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class YourProductController extends BaseController {
  YourProductController({required this.apiRepository});

  final Infrastructure apiRepository;

  final int pageSize = 10;
  var pageNumber = 0.obs;
  final ScrollController scrollController = ScrollController();
  bool canLoadingMore = true;

  var listProduct = <ProductModel?>[].obs;

  @override
  Future<void> onInit() async {
    await getListProduct();
    await super.onInit();
  }

  Future<void> getListProduct() async {
    await EasyLoading.show();
    await apiRepository.getProductList(pageNumber: pageNumber.value, pageSize: pageSize).then(
      (result) async {
        await EasyLoading.dismiss();
        if (result.data != null) {
          if (result.data!.length < pageSize) {
            canLoadingMore = false;
          }
          listProduct.value.addAll(result.data!);
          listProduct.refresh();
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
