import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/moto_insurance/controller/moto_insurance_controller.dart';

class MotoInsuranceBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<MotoInsuranceController>(() => MotoInsuranceController(apiRepository: Get.find()));
  }
}
