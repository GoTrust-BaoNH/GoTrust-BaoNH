import 'dart:async';

import 'package:go_trust/data/common/common_method.dart';
import 'package:go_trust/data/common/define_api.dart';
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
import 'package:go_trust/data/interceptors/graphql_interceptor.dart';
import 'package:go_trust/shared/models/bank_model/bank_model.dart';
import 'package:go_trust/shared/models/notification/notification_item_model.dart';
import 'package:go_trust/shared/models/payment_model/payment_type_model.dart';
import 'package:go_trust/shared/models/request/register_request.dart';
import 'package:go_trust/shared/models/response/common_response.dart';
import 'package:go_trust/shared/models/response/register_response.dart';
import 'package:go_trust/shared/models/users/login_model.dart';
import 'package:go_trust/shared/models/users/user_model.dart';

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

  Future<LoginModel> loginWithPhone({required String phoneNumber, required String password}) async {
    final c = Completer<LoginModel>();
    try {
      final results = await apiProvider.loginWithPhone(phoneNumber: phoneNumber, password: password);
      if (!results.hasException) {
        final loginModel = convertUserLoginModel(LoginMutationGraphql$Mutation.fromJson(results.data!).login!);
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

  Future<CommonResponse> registerOTP({required String phoneNumber}) async {
    final c = Completer<CommonResponse>();
    try {
      final results = await apiProvider.registerOTP(phoneNumber: phoneNumber);
      if (!results.hasException) {
        final commonResponse = convertCommonResponseModel(RegisterOtpMutationGraphql$Mutation.fromJson(results.data!).registerOtp!);
        c.complete(commonResponse);
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

  Future<LoginModel> verifyOTP({required String phoneNumber, required String otp}) async {
    final c = Completer<LoginModel>();
    try {
      final results = await apiProvider.verifyOTP(phoneNumber: phoneNumber, otp: otp);
      if (!results.hasException) {
        final loginModel = convertUserLoginModel(VerifyOtpMutationGraphql$Mutation.fromJson(results.data!).verifyOtp!);
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

  Future<String> refreshToken() async {
    final c = Completer<String>();
    try {
      final results = await apiProvider.refreshToken();
      if (!results.hasException) {
        final token = RefreshToken$Query.fromJson(results.data!).refreshToken!.token;
        c.complete(token);
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

  Future<UserModel> updatePassword({required String oldPassword, required String newPassword}) async {
    final c = Completer<UserModel>();
    try {
      final results = await apiProvider.updatePassword(oldPassword: oldPassword, newPassword: newPassword);
      if (!results.hasException) {
        final userModel = convertUserModel(UpdatePasswordMutationGraphql$Mutation.fromJson(results.data!).updatePassword!);
        c.complete(userModel);
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

  Future<UserModel> updateProfile({required String email, required String fullName, required String privateId}) async {
    final c = Completer<UserModel>();
    try {
      final results = await apiProvider.updateProfile(email: email, fullName: fullName, privateId: privateId);
      if (!results.hasException) {
        final userModel = convertUserModel(UpdateProfileMutationGraphql$Mutation.fromJson(results.data!).updateProfile!);
        c.complete(userModel);
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

  Future<NotificationItemModel> getItemNotification({required String id}) async {
    final c = Completer<NotificationItemModel>();
    try {
      final results = await apiProvider.getItemNotification(id: id);
      if (!results.hasException) {
        final itemNotification = convertItemNotificationModel(AppNotification$Query.fromJson(results.data!).appNotification!);
        c.complete(itemNotification);
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

  Future<List<NotificationItemModel>> getListNotification({required int userId}) async {
    final c = Completer<List<NotificationItemModel>>();
    try {
      final results = await apiProvider.getListNotification(userId: userId);
      if (!results.hasException) {
        final listNotification =
            convertListNotificationModel(AppNotificationList$Query.fromJson(results.data!).appNotificationList!);
        c.complete(listNotification);
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

  Future<List<PaymentType>> getListPaymentType() async {
    final c = Completer<List<PaymentType>>();
    try {
      final results = await apiProvider.getListPaymentType();
      if (!results.hasException) {
        final listPaymentType =
            convertListPaymentTypeModel(PaymentGetPaymentTypeList$Query.fromJson(results.data!).paymentGetPaymentTypeList!);
        c.complete(listPaymentType);
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

  Future<List<BankModel>> getListPaymentBank({required String paymentType}) async {
    final c = Completer<List<BankModel>>();
    try {
      final results = await apiProvider.getListPaymentBank(paymentType: paymentType);
      if (!results.hasException) {
        final listPaymentBank = convertListPaymentBankModel(PaymentGetBankList$Query.fromJson(results.data!).paymentGetBankList!);
        c.complete(listPaymentBank);
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
