import 'package:get/get.dart';
import 'package:go_trust/shared/network/bindings/network_binding.dart';

import 'package:gotrust_auth_data/gotrust_auth_data.dart' as auth_data;
import 'package:gotrust_repository_data/gotrust_repository_data.dart' as repository_data;

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get
      ..put(auth_data.ApiAuthProvider(), permanent: true)
      ..put(auth_data.ApiAuthRepository(apiProvider: Get.find()), permanent: true)
      ..put(repository_data.Infrastructure(), permanent: true)
      ..put(NetworkBinding(), permanent: true); // keep the class in memory with "permanent:true"
  }
}
