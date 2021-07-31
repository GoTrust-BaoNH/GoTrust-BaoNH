import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/oto_rescue_checkout/controller/oto_rescue_checkout_controller.dart';

class OtoRescueCheckoutBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OtoRescueCheckoutController>(() => OtoRescueCheckoutController(apiRepository: Get.find()));
  }
}
