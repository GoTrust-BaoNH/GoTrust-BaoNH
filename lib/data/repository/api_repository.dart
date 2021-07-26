import 'dart:async';

import 'package:go_trust/data/common/common_method.dart';
import 'package:go_trust/data/common/define_api.dart';

import 'package:go_trust/data/graphql/mutation/login_with_auth_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/register_otp_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/verify_otp_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/update_profile_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/update_password_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/login_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_customer_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_emergency_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_faq_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_policy_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_product_list_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_promotion_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/motor_ins_create_order_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_payment_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_recuse_car_order_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_recuse_moto_order_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_category_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/delete_repairing_order_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/update_repairing_order_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_repairing_order_mutation_graphql.dart';
import 'package:go_trust/data/graphql/query/app_notification_item_query_graphql.dart';
import 'package:go_trust/data/graphql/query/app_notification_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_bank_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_payment_type_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/refresh_token_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_category_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_customer_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_emergency_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_faq_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_policy_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_product_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_brand_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_model_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_product_query_graphql.dart';
import 'package:go_trust/data/graphql/query/motor_ins_get_metadata_query_graphql.dart';
import 'package:go_trust/data/interceptors/graphql_interceptor.dart';
import 'package:go_trust/shared/models/bank_model/bank_model.dart';
import 'package:go_trust/shared/models/brand_model/brand_model.dart';
import 'package:go_trust/shared/models/category_model/category_list_model.dart';
import 'package:go_trust/shared/models/category_model/category_model.dart';
import 'package:go_trust/shared/models/city_model/city_input_model.dart';
import 'package:go_trust/shared/models/customer_model/customer_list_model.dart';
import 'package:go_trust/shared/models/customer_model/customer_model.dart';
import 'package:go_trust/shared/models/district_model/district_input_model.dart';
import 'package:go_trust/shared/models/emergency/emergency_list_model.dart';
import 'package:go_trust/shared/models/emergency/emergency_model.dart';
import 'package:go_trust/shared/models/faq_model/faq_list_model.dart';
import 'package:go_trust/shared/models/faq_model/faq_model.dart';
import 'package:go_trust/shared/models/model_bike_model/model_bike_model.dart';
import 'package:go_trust/shared/models/moto_order_model/moto_order_model.dart';
import 'package:go_trust/shared/models/notification/notification_item_model.dart';
import 'package:go_trust/shared/models/payment_model/payment_response.dart';
import 'package:go_trust/shared/models/payment_model/payment_type_model.dart';
import 'package:go_trust/shared/models/policy_model/policy_list_model.dart';
import 'package:go_trust/shared/models/policy_model/policy_model.dart';
import 'package:go_trust/shared/models/product/product_list_model.dart';
import 'package:go_trust/shared/models/product/product_model.dart';
import 'package:go_trust/shared/models/promotion_model/promotion_model.dart';
import 'package:go_trust/shared/models/recuse_order_model/recuse_order_response.dart';
import 'package:go_trust/shared/models/repairing_order/repairing_order_response_model.dart';
import 'package:go_trust/shared/models/repairing_service_model/repairing_image_input_model.dart';
import 'package:go_trust/shared/models/request/register_request.dart';
import 'package:go_trust/shared/models/response/common_response.dart';
import 'package:go_trust/shared/models/response/register_response.dart';
import 'package:go_trust/shared/models/users/login_model.dart';
import 'package:go_trust/shared/models/users/user_model.dart';
import 'package:go_trust/shared/models/ward_model/ward_input_model.dart';

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
        final commonResponse =
            convertCommonResponseModel(RegisterOtpMutationGraphql$Mutation.fromJson(results.data!).registerOtp!);
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
        final itemNotification =
            convertItemNotificationModel(AppNotificationItemQueryGraphql$Query.fromJson(results.data!).appNotification!);
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
            convertListNotificationModel(AppNotificationListQueryGraphql$Query.fromJson(results.data!).appNotificationList!);
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
            convertListPaymentTypeModel(GetPaymentTypeListQueryGraphql$Query.fromJson(results.data!).getPaymentTypeList!);
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
        final listPaymentBank = convertListPaymentBankModel(GetBankListQueryGraphql$Query.fromJson(results.data!).getBankList!);
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

  Future<CustomerModel> createCustomer({
    required String dateOfBirth,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final c = Completer<CustomerModel>();
    try {
      final results = await apiProvider.createCustomer(
        dateOfBirth: dateOfBirth,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
      );
      if (!results.hasException) {
        final customer = convertCustomerModel(CreateCustomerMutationGraphql$Mutation.fromJson(results.data!).createCustomer!);
        c.complete(customer);
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

  Future<EmergencyModel> createEmergency({required String address, required String phone, required String serviceName}) async {
    final c = Completer<EmergencyModel>();
    try {
      final results = await apiProvider.createEmergency(address: address, phone: phone, serviceName: serviceName);
      if (!results.hasException) {
        final emergency = convertEmergencyModel(CreateEmergencyMutationGraphql$Mutation.fromJson(results.data!).createEmergency!);
        c.complete(emergency);
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

  Future<FaqModel> createFaq({required String answer, required String question}) async {
    final c = Completer<FaqModel>();
    try {
      final results = await apiProvider.createFaq(answer: answer, question: question);
      if (!results.hasException) {
        final faq = convertFaqModel(CreateFaqMutationGraphql$Mutation.fromJson(results.data!).createFaq!);
        c.complete(faq);
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

  Future<PolicyModel> createPolicy({required String description, required String name}) async {
    final c = Completer<PolicyModel>();
    try {
      final results = await apiProvider.createPolicy(description: description, name: name);
      if (!results.hasException) {
        final policy = convertPolicyModel(CreatePolicyMutationGraphql$Mutation.fromJson(results.data!).createPolicy!);
        c.complete(policy);
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

  Future<ProductModel> createProductList({
    required int categoryId,
    required double price,
    String? code,
    String? description,
    String? name,
  }) async {
    final c = Completer<ProductModel>();
    try {
      final results = await apiProvider.createProductList(
        categoryId: categoryId,
        price: price,
        code: code,
        description: description,
        name: name,
      );
      if (!results.hasException) {
        final product = convertProductModel(CreateProductListMutationGraphql$Mutation.fromJson(results.data!).createProductList!);
        c.complete(product);
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

  Future<PromotionModel> createPromotion({String? code, String? description, String? name}) async {
    final c = Completer<PromotionModel>();
    try {
      final results = await apiProvider.createPromotion(code: code, description: description, name: name);
      if (!results.hasException) {
        final promotion = convertPromotionModel(CreatePromotionMutationGraphql$Mutation.fromJson(results.data!).createPromotion!);
        c.complete(promotion);
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

  Future<MotoOrderModel> motoInsCreateOrder({
    int? amount,
    String? expDate,
    String? partner,
    String? productId,
    String? startDate,
  }) async {
    final c = Completer<MotoOrderModel>();
    try {
      final results = await apiProvider.motorInsCreateOrder(
        amount: amount,
        expDate: expDate,
        partner: partner,
        productId: productId,
        startDate: startDate,
      );
      if (!results.hasException) {
        final motoIns =
            convertMotoOrderModel(MotorInsCreateOrderMutationGraphql$Mutation.fromJson(results.data!).motorInsCreateOrder!);
        c.complete(motoIns);
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

  Future<PaymentResponse> paymentCreatePayment({String? ipAddr, String? orderId, String? paymentType}) async {
    final c = Completer<PaymentResponse>();
    try {
      final results = await apiProvider.paymentCreatePayment(bankCode: ipAddr, orderId: orderId, paymentType: paymentType);
      if (!results.hasException) {
        final payment = convertPaymentResponseModel(CreatePaymentMutationGraphql$Mutation.fromJson(results.data!).createPayment!);
        c.complete(payment);
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

  Future<CategoryModel> createCategory({String? code, String? name}) async {
    final c = Completer<CategoryModel>();
    try {
      final results = await apiProvider.createCategory(code: code, name: name);
      if (!results.hasException) {
        final category = convertCategoryModel(CreateCategoryMutationGraphql$Mutation.fromJson(results.data!).createCategory!);
        c.complete(category);
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

  Future<CategoryListModel> getCategoryList({int? pageNumber, int? pageSize}) async {
    final c = Completer<CategoryListModel>();
    try {
      final results = await apiProvider.getCategoryList(pageNumber: pageNumber, pageSize: pageSize);
      if (!results.hasException) {
        final categoryList = convertListCategoryModel(GetCategoryListQueryGraphql$Query.fromJson(results.data!).getCategoryList!);
        c.complete(categoryList);
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

  Future<CustomerListModel> getCustomerList({int? pageNumber, int? pageSize}) async {
    final c = Completer<CustomerListModel>();
    try {
      final results = await apiProvider.getCustomerList(pageNumber: pageNumber, pageSize: pageSize);
      if (!results.hasException) {
        final customerList = convertListCustomerModel(GetCustomerListQueryGraphql$Query.fromJson(results.data!).getCustomerList!);
        c.complete(customerList);
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

  Future<EmergencyListModel> getEmergencyList({int? pageNumber, int? pageSize}) async {
    final c = Completer<EmergencyListModel>();
    try {
      final results = await apiProvider.getEmergencyList(pageNumber: pageNumber, pageSize: pageSize);
      if (!results.hasException) {
        final emergencyList =
            convertListEmergencyModel(GetEmergencyListQueryGraphql$Query.fromJson(results.data!).getEmergencyList!);
        c.complete(emergencyList);
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

  Future<FaqListModel> getFaqList({int? pageNumber, int? pageSize}) async {
    final c = Completer<FaqListModel>();
    try {
      final results = await apiProvider.getFaqList(pageNumber: pageNumber, pageSize: pageSize);
      if (!results.hasException) {
        final faqList = convertListFaqListModel(GetFaqListQueryGraphql$Query.fromJson(results.data!).getFaqList!);
        c.complete(faqList);
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

  Future<PolicyListModel> getPolicyList({int? pageNumber, int? pageSize}) async {
    final c = Completer<PolicyListModel>();
    try {
      final results = await apiProvider.getPolicyList(pageNumber: pageNumber, pageSize: pageSize);
      if (!results.hasException) {
        final policyList = convertListPolicyModel(GetPolicyListQueryGraphql$Query.fromJson(results.data!).getPolicyList!);
        c.complete(policyList);
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

  Future<ProductListModel> getProductList({int? pageNumber, int? pageSize}) async {
    final c = Completer<ProductListModel>();
    try {
      final results = await apiProvider.getProductList(pageNumber: pageNumber, pageSize: pageSize);
      if (!results.hasException) {
        final productList = convertListProductModel(GetProductListQueryGraphql$Query.fromJson(results.data!).getProductList!);
        c.complete(productList);
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

  Future<List<BrandModel>> getRecuseMotoBrand() async {
    final c = Completer<List<BrandModel>>();
    try {
      final results = await apiProvider.getRecuseMotoBrand();
      if (!results.hasException) {
        final recuseMotoBrandList =
            convertBrandListModel(GetRecuseMotoBrandQueryGraphql$Query.fromJson(results.data!).getRecuseMotoBrand!);
        c.complete(recuseMotoBrandList);
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

  Future<List<ModelBikeModel>> getRecuseMoto({String? brandId}) async {
    final c = Completer<List<ModelBikeModel>>();
    try {
      final results = await apiProvider.getRecuseMoto(brandId: brandId);
      if (!results.hasException) {
        final recuseMoto =
            convertModelBikeListModel(GetRecuseMotoModelQueryGraphql$Query.fromJson(results.data!).getRecuseMotoModel!);
        c.complete(recuseMoto);
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

  Future<List<ProductModel?>> getRecuseMotoProduct() async {
    final c = Completer<List<ProductModel?>>();
    try {
      final results = await apiProvider.getRecuseMotoProduct();
      if (!results.hasException) {
        final recuseMotoProduct =
            convertProductListModel(GetRecuseMotoProductQueryGraphql$Query.fromJson(results.data!).getRecuseMotoProduct!);
        c.complete(recuseMotoProduct);
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

  Future<String> motoInsGetMetaData({String? partner}) async {
    final c = Completer<String>();
    try {
      final results = await apiProvider.motoInsGetMetaData(partner: partner);
      if (!results.hasException) {
        final motoInsMetaData = MotorInsGetMetadataQueryGraphql$Query.fromJson(results.data!).motorInsGetMetadata!.data;
        c.complete(motoInsMetaData);
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

  Future<RecuseOrderModel> createRecuseCarOrder({
    String? brand,
    String? fullName,
    String? model,
    String? numberPlate,
    String? phoneNumber,
    String? productId,
    String? startDate,
  }) async {
    final c = Completer<RecuseOrderModel>();
    try {
      final results = await apiProvider.createRecuseCarOrder(
        brand: brand,
        fullName: fullName,
        model: model,
        numberPlate: numberPlate,
        phoneNumber: phoneNumber,
        productId: productId,
        startDate: startDate,
      );
      if (!results.hasException) {
        final recuseCar =
            convertRecuseOrderModel(CreateRecuseCarOrderMutationGraphql$Mutation.fromJson(results.data!).createRecuseCarOrder);
        c.complete(recuseCar);
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

  Future<RecuseOrderModel> createRecuseMotoOrder({
    String? brand,
    String? brandId,
    String? capacity,
    String? fullName,
    String? modelId,
    String? model,
    String? numberPlate,
    String? phoneNumber,
    String? productId,
    String? startDate,
  }) async {
    final c = Completer<RecuseOrderModel>();
    try {
      final results = await apiProvider.createRecuseMotoOrder(
        brand: brand,
        brandId: brandId,
        capacity: capacity,
        fullName: fullName,
        modelId: modelId,
        model: model,
        numberPlate: numberPlate,
        phoneNumber: phoneNumber,
        productId: productId,
        startDate: startDate,
      );
      if (!results.hasException) {
        final recuseMoto =
            convertRecuseOrderModel(CreateRecuseMotoOrderMutationGraphql$Mutation.fromJson(results.data!).createRecuseMotoOrder);
        c.complete(recuseMoto);
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

  Future<RepairingOrderResponseModel> deleteRepairingOrder({String? uuid}) async {
    final c = Completer<RepairingOrderResponseModel>();
    try {
      final results = await apiProvider.deleteRepairingOrder(uuid: uuid);
      if (!results.hasException) {
        final repairingOrder = convertRepairingOrderResponseModel(
            DeleteRepairingOrderMutationGraphql$Mutation.fromJson(results.data!).deleteRepairingOrder);
        c.complete(repairingOrder);
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

  Future<RepairingOrderResponseModel> createRepairingOrder({
    required bool isPaid,
    CityInputModel? city,
    String? countryCode,
    String? customerAddress,
    String? customerName,
    String? customerPhone,
    String? description,
    DistrictInputModel? district,
    String? endTime,
    String? externalId,
    List<RepairingImageInputModel?>? images,
    String? name,
    String? priority,
    String? service,
    String? status,
    WardInputModel? ward,
  }) async {
    final c = Completer<RepairingOrderResponseModel>();
    try {
      final results = await apiProvider.createRepairingOrder(
        city: city,
        countryCode: countryCode,
        customerAddress: customerAddress,
        customerName: customerName,
        customerPhone: customerPhone,
        description: description,
        district: district,
        endTime: endTime,
        externalId: externalId,
        images: images,
        isPaid: isPaid,
        name: name,
        priority: priority,
        service: service,
        status: status,
        ward: ward,
      );
      if (!results.hasException) {
        final repairingOrder = convertRepairingOrderResponseModel(
            CreateRepairingOrderMutationGraphql$Mutation.fromJson(results.data!).createRepairingOrder);
        c.complete(repairingOrder);
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

  Future<RepairingOrderResponseModel> updateRepairingOrder({
    required bool paid,
    required String uuid,
    CityInputModel? city,
    String? countryCode,
    String? customerAddress,
    String? customerName,
    String? customerPhone,
    String? description,
    DistrictInputModel? district,
    String? endTime,
    String? externalId,
    List<RepairingImageInputModel?>? images,
    String? name,
    String? priority,
    String? service,
    String? status,
    WardInputModel? ward,
  }) async {
    final c = Completer<RepairingOrderResponseModel>();
    try {
      final results = await apiProvider.updateRepairingOrder(
        city: city,
        customerAddress: customerAddress,
        customerName: customerName,
        customerPhone: customerPhone,
        description: description,
        district: district,
        endTime: endTime,
        externalId: externalId,
        images: images,
        paid: paid,
        name: name,
        priority: priority,
        service: service,
        status: status,
        uuid: uuid,
        ward: ward,
      );
      if (!results.hasException) {
        final repairingOrder = convertRepairingOrderResponseModel(
            UpdateRepairingOrderMutationGraphql$Mutation.fromJson(results.data!).updateRepairingOrder);
        c.complete(repairingOrder);
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
