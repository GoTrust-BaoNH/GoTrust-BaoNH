import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/moto_rescue_buy/controller/moto_rescue_buy_controller.dart';
import 'package:go_trust/modules/moto_rescue_checkout/controller/moto_rescue_checkout_controller.dart';

class MotoRescueBuyBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<MotoRescueBuyController>(() => MotoRescueBuyController(apiRepository: Get.find()));
  }
}
