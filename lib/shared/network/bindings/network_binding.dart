import 'package:get/get.dart';
import 'package:go_trust/shared/network/controllers/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
