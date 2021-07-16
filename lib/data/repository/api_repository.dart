import 'dart:async';

import 'package:go_trust/data/common/common_method.dart';
import 'package:go_trust/data/common/define_api.dart';
import 'package:go_trust/data/graphql/mutation/login_with_auth_mutation_graphql.dart';
import 'package:go_trust/data/interceptors/graphql_interceptor.dart';
import 'package:go_trust/shared/models/request/register_request.dart';
import 'package:go_trust/shared/models/response/register_response.dart';
import 'package:go_trust/shared/models/users/login_model.dart';

import '../../data/service/api_provider.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register(REGISTER_URN, data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<LoginModel> getLoginUserWithAuth({required String provider, required String token}) async {
    final c = Completer<LoginModel>();
    try {
      final results = await apiProvider.loginOAuth(provider: provider, token: token);
      if (!results.hasException) {
        final loginModel = convertUserLoginModel(LoginWithAuthMutationGraphql$Mutation.fromJson(results.data!).loginOAuth!);
        c.complete(loginModel);
      } else {
        print('Exception: ${results.exception}');
        c.completeError(handleErrorGraphQL(results.exception!));
      }
    } catch (ex, stackTrace) {
      print(stackTrace.toString());
      c.completeError(ex.toString());
    }

    return c.future;
  }

  Future<LoginModel> registerOTP({required String phoneNumber}) async {
    final c = Completer<LoginModel>();
    try {
      final results = await apiProvider.registerOTP(phoneNumber: phoneNumber);
      if (!results.hasException) {
        final loginModel = convertUserLoginModel(LoginWithAuthMutationGraphql$Mutation.fromJson(results.data!).loginOAuth!);
        c.complete(loginModel);
      } else {
        print('Exception: ${results.exception}');
        c.completeError(handleErrorGraphQL(results.exception!));
      }
    } catch (ex, stackTrace) {
      print(stackTrace.toString());
      c.completeError(ex.toString());
    }

    return c.future;
  }
}
