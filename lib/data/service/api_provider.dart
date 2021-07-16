import 'package:get/get.dart';
import 'package:go_trust/data/base/base_graphql_provider.dart';
import 'package:go_trust/data/common/common_method.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/data/graphql/mutation/login_with_auth_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/register_otp_mutation_graphql.dart';
import 'package:go_trust/shared/models/request/login_request.dart';
import 'package:go_trust/shared/models/request/register_request.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;

import '../../data/base/base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> login(String path, LoginRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> register(String path, RegisterRequest data) {
    return post(path, data.toJson());
  }

  Future<graphql.QueryResult> loginOAuth({required String provider, required String token}) {
    print('Request login with auth API: URI: ');
    return BaseAuthGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: LoginWithAuthMutationGraphqlMutation(
          variables: LoginWithAuthMutationGraphqlArguments(),
        ).document,
        variables: {
          PROVIDER_FIELD: provider,
          TOKEN_FIELD: token,
        },
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> registerOTP({required String phoneNumber}) {
    print('Request registerOTP with auth API: URI: ');
    return BaseAuthGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: RegisterOtpMutationGraphqlMutation(
          variables: RegisterOtpMutationGraphqlArguments(phoneNumber: phoneNumber),
        ).document,
        variables: RegisterOtpMutationGraphqlArguments(phoneNumber: phoneNumber).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }
}
