import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/voucher/controller/voucher_controller.dart';

class VoucherBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<VoucherController>(() => VoucherController(apiRepository: Get.find()));
  }
}
