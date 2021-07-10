import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/bank/controller/bank_controller.dart';

class BankBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<BankController>(() => BankController(apiRepository: Get.find()));
  }
}
