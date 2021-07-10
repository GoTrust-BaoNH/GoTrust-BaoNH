import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/your_product/controller/your_product_controller.dart';

class YourProductBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<YourProductController>(() => YourProductController(apiRepository: Get.find()));
  }
}
