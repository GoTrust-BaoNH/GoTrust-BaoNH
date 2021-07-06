import 'package:get/get.dart';
import 'package:go_trust/data/interceptors/auth_interceptor.dart';
import 'package:go_trust/data/interceptors/request_interceptor.dart';
import 'package:go_trust/data/interceptors/response_interceptor.dart';
import 'package:go_trust/resource/config/config_environment.dart';
import '../../shared/constants/common.dart';

class BaseProvider extends GetConnect {
  final config = Get.find<EnvConfiguration>();

  @override
  void onInit() {
    httpClient
      ..baseUrl = config.value[GraphQLAuthUrl]
      ..addAuthenticator(authInterceptor)
      ..addRequestModifier(requestInterceptor)
      ..addResponseModifier(responseInterceptor);
  }
}
