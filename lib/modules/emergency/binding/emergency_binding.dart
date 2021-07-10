import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/emergency/controller/emergency_controller.dart';

class EmergencyBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<EmergencyController>(() => EmergencyController(apiRepository: Get.find()));
  }
}
