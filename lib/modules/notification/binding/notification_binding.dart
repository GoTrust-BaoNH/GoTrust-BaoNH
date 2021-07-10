import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/notification/controller/notification_controller.dart';

class NotificationBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<NotificationController>(() => NotificationController(apiRepository: Get.find()));
  }
}
