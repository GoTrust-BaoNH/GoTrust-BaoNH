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
import 'package:go_trust/shared/widgets/search_dialog_widget/search_dialog_widget.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import 'package:gotrust_repository_data/shared/models/brand_model/brand_model.dart';
import 'package:gotrust_repository_data/shared/models/model_bike_model/model_bike_model.dart';
import 'package:intl/intl.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class MotoRescueCheckoutController extends BaseController {
  MotoRescueCheckoutController({required this.apiRepository});

  final Infrastructure apiRepository;
  late List<BrandModel> listBrand;
  List<ModelBikeModel> listModelBike = [];
  var brandSelected = BrandModel().obs;
  var modelBikeSelected = ModelBikeModel().obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController plateController = TextEditingController();

  @override
  Future<void> onInit() async {
    await getRecuseMotoBrand();
    await super.onInit();
  }

  Future<void> getRecuseMotoBrand() async {
    await EasyLoading.show();
    await apiRepository.getRecuseMotoBrand().then(
      (result) async {
        await EasyLoading.dismiss();
        if (result.listBrand!.isNotEmpty) {
          listBrand = result.listBrand!;
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

  Future<void> getRecuseMotoModel() async {
    await EasyLoading.show();
    await apiRepository.getRecuseMoto(brandId: brandSelected.value.bikeId).then(
      (result) async {
        await EasyLoading.dismiss();
        if (result.listModelBikeModel!.isNotEmpty) {
          listModelBike = result.listModelBikeModel!;
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

  Future<void> pickBrand(BuildContext context) async {
    final Widget dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SearchDialogWidget(
        objects: listBrand,
      ),
    );

    final selectBrand = await Get.dialog(dialog);

    if (selectBrand != null) {
      brandSelected.value = selectBrand;
    }
  }

  Future<void> pickModelBike(BuildContext context) async {
    if (brandSelected.value.bikeId == null) {
      showError(content: 'Vui lòng chọn hãng xe');
      return;
    }

    await getRecuseMotoModel();

    final Widget dialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SearchDialogWidget(
        objects: listModelBike,
      ),
    );

    final selectModel = await Get.dialog(dialog);

    if (selectModel != null) {
      modelBikeSelected.value = selectModel;
    }
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  Future<void> onBuyNowButtonPressed() async {
    if (!validateInfo()) {
      return;
    }
    await EasyLoading.show();
    await apiRepository
        .createRecuseMotoOrder(
      brand: brandSelected.value.bikeName,
      brandId: brandSelected.value.bikeId,
      model: modelBikeSelected.value.bikeName,
      modelId: modelBikeSelected.value.bikeId,
      capacity: '175cc',
      fullName: nameController.text,
      phoneNumber: phoneController.text,
      numberPlate: plateController.text,
      productId: '5',
      startDate: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    )
        .then(
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

  bool validateInfo() {
    if (nameController.text.isEmpty) {
      showError(content: 'moto_rescue_name_invalid'.tr);
      return false;
    }
    if (phoneController.text.isEmpty) {
      showError(content: 'moto_rescue_phone_invalid'.tr);
      return false;
    }
    if (plateController.text.isEmpty) {
      showError(content: 'moto_rescue_plate_invalid'.tr);
      return false;
    }
    if (brandSelected.value.bikeId == null) {
      showError(content: 'moto_rescue_brand_invalid'.tr);
      return false;
    }
    if (modelBikeSelected.value.bikeId == null) {
      showError(content: 'moto_rescue_model_invalid'.tr);
      return false;
    }

    return true;
  }
}
