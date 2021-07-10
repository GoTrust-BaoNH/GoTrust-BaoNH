import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/payment_info/controller/payment_info_controller.dart';

class PaymentInfoBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<PaymentInfoController>(() => PaymentInfoController(apiRepository: Get.find()));
  }
}
