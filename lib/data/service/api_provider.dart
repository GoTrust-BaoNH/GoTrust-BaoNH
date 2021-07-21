import 'package:get/get.dart';
import 'package:go_trust/data/base/base_graphql_provider.dart';
import 'package:go_trust/data/common/common_method.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/data/graphql/mutation/login_with_auth_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/register_otp_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/verify_otp_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/update_profile_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/update_password_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/login_mutation_graphql.dart';
import 'package:go_trust/data/graphql/query/app_notification_item_query_graphql.dart';
import 'package:go_trust/data/graphql/query/app_notification_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/payment_get_bank_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/payment_get_payment_type_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/refresh_token_query_graphql.dart';
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

  Future<graphql.QueryResult> loginWithPhone({required String phoneNumber, required String password}) {
    print('Request loginWithPhone with auth API: ');
    return BaseAuthGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: LoginMutationGraphqlMutation(
          variables: LoginMutationGraphqlArguments(phoneNumber: phoneNumber, password: password),
        ).document,
        variables: LoginMutationGraphqlArguments(phoneNumber: phoneNumber, password: password).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
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
    print('Request registerOTP with auth API: ');
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

  Future<graphql.QueryResult> updatePassword({required String oldPassword, required String newPassword}) {
    print('Request updatePassword with auth API: ');
    return BaseAuthGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: UpdatePasswordMutationGraphqlMutation(
          variables: UpdatePasswordMutationGraphqlArguments(oldPassword: oldPassword, newPassword: newPassword),
        ).document,
        variables: UpdatePasswordMutationGraphqlArguments(oldPassword: oldPassword, newPassword: newPassword).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> updateProfile({
    required String email,
    required String fullName,
    required String privateId,
  }) {
    print('Request updateProfile with auth API: ');
    return BaseAuthGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: UpdateProfileMutationGraphqlMutation(
          variables: UpdateProfileMutationGraphqlArguments(email: email, fullName: fullName, privateId: privateId),
        ).document,
        variables: UpdateProfileMutationGraphqlArguments(email: email, fullName: fullName, privateId: privateId).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> verifyOTP({required String phoneNumber, required String otp}) {
    print('Request verifyOTP with auth API: ');
    return BaseAuthGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: VerifyOtpMutationGraphqlMutation(
          variables: VerifyOtpMutationGraphqlArguments(phoneNumber: phoneNumber, otp: otp),
        ).document,
        variables: VerifyOtpMutationGraphqlArguments(phoneNumber: phoneNumber, otp: otp).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> refreshToken() {
    print('Request refreshToken');
    return BaseAuthGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: RefreshTokenQuery().document,
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getItemNotification({required String id}) {
    print('Request getItemNotification with id = $id');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: AppNotificationQuery(
          variables: AppNotificationArguments(id: id),
        ).document,
        variables: AppNotificationArguments(id: id).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getListNotification({required int userId}) {
    print('Request getListNotification');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: AppNotificationListQuery(
          variables: AppNotificationListArguments(userId: userId),
        ).document,
        variables: AppNotificationListArguments(userId: userId).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getListPaymentType() {
    print('Request getListPaymentType');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: PaymentGetPaymentTypeListQuery().document,
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getListPaymentBank({required String paymentType}) {
    print('Request getListPaymentBank');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: PaymentGetBankListQuery(
          variables: PaymentGetBankListArguments(paymentType: paymentType),
        ).document,
        variables: PaymentGetBankListArguments(paymentType: paymentType).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }
}
