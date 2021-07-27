import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/oto_rescue/controller/moto_rescue_controller.dart';

class OtoRescueBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<OtoRescueController>(() => OtoRescueController(apiRepository: Get.find()));
  }
}
