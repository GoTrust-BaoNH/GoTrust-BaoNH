import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/moto_rescue_checkout/controller/moto_rescue_checkout_controller.dart';

class MotoRescueCheckoutBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<MotoRescueCheckoutController>(() => MotoRescueCheckoutController(apiRepository: Get.find()));
  }
}
