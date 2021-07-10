import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/moto_rescue/controller/moto_rescue_controller.dart';

class MotoRescueBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<MotoRescueController>(() => MotoRescueController(apiRepository: Get.find()));
  }
}
