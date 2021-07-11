import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/models/product/product_enum.dart';
import 'package:go_trust/shared/models/product/product_model.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import '../../../data/repository/api_repository.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class YourProductController extends BaseController {
  YourProductController({required this.apiRepository});

  final ApiRepository apiRepository;


  List<YourProductModel> list = [
    YourProductModel(
      productType: ProductEnum.MotoInsurance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().add(const Duration(days: 10)).toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MedicalOnline,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().toString(),
    ),
    YourProductModel(
      productType: ProductEnum.OnlineShopping,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      isContractProcessing: true,
      expiredDate: DateTime.now().add(const Duration(days: 10)).toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoRescue,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      isContractProcessing: true,
      expiredDate: DateTime.now().toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoInsurance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoInsurance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().add(const Duration(days: 10)).toString(),
    ),
    YourProductModel(
      productType: ProductEnum.MotoInsurance,
      productName: 'Bảo hiểm TNDSBB Xe máy',
      contractCode: 'Mã hợp đồng: HK012345',
      price: '1.500.000',
      expiredDate: DateTime.now().toString(),
    ),
  ];

  @override
  Future<void> onInit() async {
    await super.onInit();
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
