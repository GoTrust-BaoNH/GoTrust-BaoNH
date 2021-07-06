import 'package:get/get.dart';
import 'package:go_trust/data/repository/api_repository.dart';
import 'package:go_trust/data/service/api_provider.dart';
import 'package:go_trust/shared/network/bindings/network_binding.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get
      ..put(ApiProvider(), permanent: true)
      ..put(ApiRepository(apiProvider: Get.find()), permanent: true)
      ..put(NetworkBinding(), permanent: true); // keep the class in memory with "permanent:true"
  }
}
