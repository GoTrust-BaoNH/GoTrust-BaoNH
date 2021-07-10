import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/models/payment_model/payment_method_model.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import '../../../data/repository/api_repository.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class PaymentMethodController extends BaseController {
  PaymentMethodController({required this.apiRepository});

  final ApiRepository apiRepository;

  List<PaymentMethodModel> viewModel = [];
  int currentMethod = 0;

  @override
  Future<void> onInit() async {
    await super.onInit();
    for (var i = 0; i < 4; i++) {
      viewModel.add(PaymentMethodModel.fromMock());
    }
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  void onNextButtonPressed() {
    // Navigator.of(context).pushNamed(RouteList.bankScreen);
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
