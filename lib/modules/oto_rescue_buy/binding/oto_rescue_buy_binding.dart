import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/oto_rescue_buy/controller/oto_rescue_buy_controller.dart';

class OtoRescueBuyBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OtoRescueBuyController>(() => OtoRescueBuyController(apiRepository: Get.find()));
  }
}
