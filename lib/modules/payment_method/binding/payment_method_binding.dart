import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/payment_method/controller/payment_method_controller.dart';

class PaymentMethodBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<PaymentMethodController>(() => PaymentMethodController(apiRepository: Get.find()));
  }
}
