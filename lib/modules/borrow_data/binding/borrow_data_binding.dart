import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/borrow_data/controller/borrow_data_controller.dart';

class BorrowDataBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<BorrowDataController>(() => BorrowDataController(apiRepository: Get.find()));
  }
}
