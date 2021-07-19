import 'package:get/get.dart';
import 'package:go_trust/data/base/base_binding.dart';
import 'package:go_trust/modules/settings/controller/settings_controller.dart';

class SettingsBinding extends BaseBinding {
  @override
  void dependencies() {
    super.dependencies();
    Get.lazyPut<SettingsController>(() => SettingsController(apiRepository: Get.find()));
  }
}
