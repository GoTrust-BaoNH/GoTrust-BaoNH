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
import 'package:go_trust/data/graphql/mutation/update_repairing_order_mutation_graphql.dart' as update_repairing;
import 'package:go_trust/data/graphql/mutation/create_repairing_order_mutation_graphql.dart' as create_repairing;
import 'package:go_trust/data/graphql/mutation/delete_repairing_order_mutation_graphql.dart';
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
import 'package:go_trust/data/graphql/query/get_promotion_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_brand_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_model_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_product_query_graphql.dart';
import 'package:go_trust/data/graphql/query/motor_ins_get_metadata_query_graphql.dart';
import 'package:go_trust/shared/models/city_model/city_input_model.dart';
import 'package:go_trust/shared/models/district_model/district_input_model.dart';
import 'package:go_trust/shared/models/repairing_service_model/repairing_image_input_model.dart';
import 'package:go_trust/shared/models/request/login_request.dart';
import 'package:go_trust/shared/models/request/register_request.dart';
import 'package:go_trust/shared/models/ward_model/ward_input_model.dart';
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
        document: AppNotificationItemQueryGraphqlQuery(
          variables: AppNotificationItemQueryGraphqlArguments(id: id),
        ).document,
        variables: AppNotificationItemQueryGraphqlArguments(id: id).toJson(),
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
        document: AppNotificationListQueryGraphqlQuery(
          variables: AppNotificationListQueryGraphqlArguments(userId: userId),
        ).document,
        variables: AppNotificationListQueryGraphqlArguments(userId: userId).toJson(),
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
        document: GetPaymentTypeListQueryGraphqlQuery().document,
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
        document: GetBankListQueryGraphqlQuery(
          variables: GetBankListQueryGraphqlArguments(paymentType: paymentType),
        ).document,
        variables: GetBankListQueryGraphqlArguments(paymentType: paymentType).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createCustomer({
    required String dateOfBirth,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
  }) {
    print('Request createCustomer mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreateCustomerMutationGraphqlMutation(
          variables: CreateCustomerMutationGraphqlArguments(
            dateOfBirth: dateOfBirth,
            email: email,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
          ),
        ).document,
        variables: CreateCustomerMutationGraphqlArguments(
          dateOfBirth: dateOfBirth,
          email: email,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createEmergency({required String address, required String phone, required String serviceName}) {
    print('Request createEmergency mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreateEmergencyMutationGraphqlMutation(
          variables: CreateEmergencyMutationGraphqlArguments(
            address: address,
            phone: phone,
            serviceName: serviceName,
          ),
        ).document,
        variables: CreateEmergencyMutationGraphqlArguments(
          address: address,
          phone: phone,
          serviceName: serviceName,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createFaq({required String answer, required String question}) {
    print('Request createFaq mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreateFaqMutationGraphqlMutation(
          variables: CreateFaqMutationGraphqlArguments(
            answer: answer,
            question: question,
          ),
        ).document,
        variables: CreateFaqMutationGraphqlArguments(
          answer: answer,
          question: question,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createPolicy({required String description, required String name}) {
    print('Request createPolicy mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreatePolicyMutationGraphqlMutation(
          variables: CreatePolicyMutationGraphqlArguments(
            description: description,
            name: name,
          ),
        ).document,
        variables: CreatePolicyMutationGraphqlArguments(
          description: description,
          name: name,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createProductList({
    required int categoryId,
    required double price,
    String? code,
    String? description,
    String? name,
  }) {
    print('Request createProductList mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreateProductListMutationGraphqlMutation(
          variables: CreateProductListMutationGraphqlArguments(
            categoryId: categoryId,
            price: price,
            code: code,
            description: description,
            name: name,
          ),
        ).document,
        variables: CreateProductListMutationGraphqlArguments(
          categoryId: categoryId,
          price: price,
          code: code,
          description: description,
          name: name,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createPromotion({String? code, String? description, String? name}) {
    print('Request createPromotion mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreatePromotionMutationGraphqlMutation(
          variables: CreatePromotionMutationGraphqlArguments(
            code: code,
            description: description,
            name: name,
          ),
        ).document,
        variables: CreatePromotionMutationGraphqlArguments(
          code: code,
          description: description,
          name: name,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> motorInsCreateOrder({
    int? amount,
    String? expDate,
    String? partner,
    String? productId,
    String? startDate,
  }) {
    print('Request motorInsCreateOrder mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: MotorInsCreateOrderMutationGraphqlMutation(
          variables: MotorInsCreateOrderMutationGraphqlArguments(
            amount: amount,
            expDate: expDate,
            partner: partner,
            productId: productId,
            startDate: startDate,
          ),
        ).document,
        variables: MotorInsCreateOrderMutationGraphqlArguments(
          amount: amount,
          expDate: expDate,
          partner: partner,
          productId: productId,
          startDate: startDate,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> paymentCreatePayment({
    String? bankCode,
    String? orderId,
    String? paymentType,
  }) {
    print('Request paymentCreatePayment mutation');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreatePaymentMutationGraphqlMutation(
          variables: CreatePaymentMutationGraphqlArguments(
            bankCode: bankCode,
            orderId: orderId,
            paymentType: paymentType,
          ),
        ).document,
        variables: CreatePaymentMutationGraphqlArguments(
          bankCode: bankCode,
          orderId: orderId,
          paymentType: paymentType,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createCategory({String? code, String? name}) {
    print('Request createCategory query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreateCategoryMutationGraphqlMutation(
          variables: CreateCategoryMutationGraphqlArguments(
            code: code,
            name: name,
          ),
        ).document,
        variables: CreateCategoryMutationGraphqlArguments(
          code: code,
          name: name,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getCategoryList({int? pageNumber, int? pageSize}) {
    print('Request getCategoryList query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetCategoryListQueryGraphqlQuery(
          variables: GetCategoryListQueryGraphqlArguments(
            pageNumber: pageNumber,
            pageSize: pageSize,
          ),
        ).document,
        variables: GetCategoryListQueryGraphqlArguments(
          pageNumber: pageNumber,
          pageSize: pageSize,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getCustomerList({int? pageNumber, int? pageSize}) {
    print('Request getCustomerList query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetCustomerListQueryGraphqlQuery(
          variables: GetCustomerListQueryGraphqlArguments(
            pageNumber: pageNumber,
            pageSize: pageSize,
          ),
        ).document,
        variables: GetCustomerListQueryGraphqlArguments(
          pageNumber: pageNumber,
          pageSize: pageSize,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getEmergencyList({int? pageNumber, int? pageSize}) {
    print('Request getEmergencyList query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetEmergencyListQueryGraphqlQuery(
          variables: GetEmergencyListQueryGraphqlArguments(
            pageNumber: pageNumber,
            pageSize: pageSize,
          ),
        ).document,
        variables: GetEmergencyListQueryGraphqlArguments(
          pageNumber: pageNumber,
          pageSize: pageSize,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getFaqList({int? pageNumber, int? pageSize}) {
    print('Request getFaqList query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetFaqListQueryGraphqlQuery(
          variables: GetFaqListQueryGraphqlArguments(
            pageNumber: pageNumber,
            pageSize: pageSize,
          ),
        ).document,
        variables: GetFaqListQueryGraphqlArguments(
          pageNumber: pageNumber,
          pageSize: pageSize,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getPolicyList({int? pageNumber, int? pageSize}) {
    print('Request getPolicyList query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetPolicyListQueryGraphqlQuery(
          variables: GetPolicyListQueryGraphqlArguments(
            pageNumber: pageNumber,
            pageSize: pageSize,
          ),
        ).document,
        variables: GetPolicyListQueryGraphqlArguments(
          pageNumber: pageNumber,
          pageSize: pageSize,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getProductList({int? pageNumber, int? pageSize}) {
    print('Request getProductList query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetProductListQueryGraphqlQuery(
          variables: GetProductListQueryGraphqlArguments(
            pageNumber: pageNumber,
            pageSize: pageSize,
          ),
        ).document,
        variables: GetProductListQueryGraphqlArguments(
          pageNumber: pageNumber,
          pageSize: pageSize,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getPromotionList({int? pageNumber, int? pageSize}) {
    print('Request getPromotionList query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetPromotionListQueryGraphqlQuery(
          variables: GetPromotionListQueryGraphqlArguments(
            pageNumber: pageNumber,
            pageSize: pageSize,
          ),
        ).document,
        variables: GetPromotionListQueryGraphqlArguments(
          pageNumber: pageNumber,
          pageSize: pageSize,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getRecuseMotoBrand() {
    print('Request getRecuseMotoBrand query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetRecuseMotoBrandQueryGraphqlQuery().document,
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getRecuseMoto({String? brandId}) {
    print('Request getRecuseMoto query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetRecuseMotoModelQueryGraphqlQuery(
          variables: GetRecuseMotoModelQueryGraphqlArguments(
            brandId: brandId,
          ),
        ).document,
        variables: GetRecuseMotoModelQueryGraphqlArguments(
          brandId: brandId,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> getRecuseMotoProduct() {
    print('Request getRecuseMotoProduct query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: GetRecuseMotoProductQueryGraphqlQuery().document,
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> motoInsGetMetaData({String? partner}) {
    print('Request motoInsGetMetaData query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: MotorInsGetMetadataQueryGraphqlQuery(
          variables: MotorInsGetMetadataQueryGraphqlArguments(
            partner: partner,
          ),
        ).document,
        variables: MotorInsGetMetadataQueryGraphqlArguments(
          partner: partner,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createRecuseCarOrder({
    String? brand,
    String? fullName,
    String? model,
    String? numberPlate,
    String? phoneNumber,
    String? productId,
    String? startDate,
  }) {
    print('Request createRecuseCarOrder query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreateRecuseCarOrderMutationGraphqlMutation(
          variables: CreateRecuseCarOrderMutationGraphqlArguments(
            brand: brand,
            fullName: fullName,
            model: model,
            numberPlate: numberPlate,
            phoneNumber: phoneNumber,
            productId: productId,
            startDate: startDate,
          ),
        ).document,
        variables: CreateRecuseCarOrderMutationGraphqlArguments(
          brand: brand,
          fullName: fullName,
          model: model,
          numberPlate: numberPlate,
          phoneNumber: phoneNumber,
          productId: productId,
          startDate: startDate,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createRecuseMotoOrder({
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
  }) {
    print('Request createRecuseMotoOrder query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: CreateRecuseMotoOrderMutationGraphqlMutation(
          variables: CreateRecuseMotoOrderMutationGraphqlArguments(
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
          ),
        ).document,
        variables: CreateRecuseMotoOrderMutationGraphqlArguments(
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
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> deleteRepairingOrder({String? uuid}) {
    print('Request deleteRepairingOrder query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: DeleteRepairingOrderMutationGraphqlMutation(
          variables: DeleteRepairingOrderMutationGraphqlArguments(uuid: uuid),
        ).document,
        variables: DeleteRepairingOrderMutationGraphqlArguments(uuid: uuid).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> createRepairingOrder({
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
  }) {
    print('Request createRepairingOrder query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: create_repairing.CreateRepairingOrderMutationGraphqlMutation(
          variables: create_repairing.CreateRepairingOrderMutationGraphqlArguments(
            city: convertCityInputModel(city) as create_repairing.CityInput?,
            countryCode: countryCode,
            customerAddress: customerAddress,
            customerName: customerName,
            customerPhone: customerPhone,
            description: description,
            district: convertDistrictInputModel(district) as create_repairing.DistrictInput?,
            endTime: endTime,
            externalId: externalId,
            images: convertListRepairingImageInputModel(images) as List<create_repairing.RepairingImageInput?>,
            isPaid: isPaid,
            name: name,
            priority: priority,
            service: service,
            status: status,
            ward: convertWardInputModel(ward) as create_repairing.WardInput?,
          ),
        ).document,
        variables: create_repairing.CreateRepairingOrderMutationGraphqlArguments(
          city: convertCityInputModel(city) as create_repairing.CityInput?,
          countryCode: countryCode,
          customerAddress: customerAddress,
          customerName: customerName,
          customerPhone: customerPhone,
          description: description,
          district: convertDistrictInputModel(district) as create_repairing.DistrictInput?,
          endTime: endTime,
          externalId: externalId,
          images: convertListRepairingImageInputModel(images) as List<create_repairing.RepairingImageInput?>,
          isPaid: isPaid,
          name: name,
          priority: priority,
          service: service,
          status: status,
          ward: convertWardInputModel(ward) as create_repairing.WardInput?,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }

  Future<graphql.QueryResult> updateRepairingOrder({
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
  }) {
    print('Request updateRepairingOrder query');
    return BaseServiceGraphQLProvider.instance.value
        .query(
      graphql.QueryOptions(
        document: update_repairing.UpdateRepairingOrderMutationGraphqlMutation(
          variables: update_repairing.UpdateRepairingOrderMutationGraphqlArguments(
            city: convertCityInputModel(city) as update_repairing.CityInput?,
            customerAddress: customerAddress,
            customerName: customerName,
            customerPhone: customerPhone,
            description: description,
            district: convertDistrictInputModel(district) as update_repairing.DistrictInput?,
            endTime: endTime,
            externalId: externalId,
            images: convertListRepairingImageInputModel(images) as List<update_repairing.RepairingImageInput?>?,
            paid: paid,
            name: name,
            priority: priority,
            service: service,
            status: status,
            uuid: uuid,
            ward: convertWardInputModel(ward) as update_repairing.WardInput?,
          ),
        ).document,
        variables: update_repairing.UpdateRepairingOrderMutationGraphqlArguments(
          city: convertCityInputModel(city) as update_repairing.CityInput?,
          customerAddress: customerAddress,
          customerName: customerName,
          customerPhone: customerPhone,
          description: description,
          district: convertDistrictInputModel(district) as update_repairing.DistrictInput?,
          endTime: endTime,
          externalId: externalId,
          images: convertListRepairingImageInputModel(images) as List<update_repairing.RepairingImageInput?>?,
          paid: paid,
          name: name,
          priority: priority,
          service: service,
          status: status,
          uuid: uuid,
          ward: convertWardInputModel(ward) as update_repairing.WardInput?,
        ).toJson(),
      ),
    )
        .timeout(Duration(seconds: int.parse(TIME_OUT_SECOND)), onTimeout: () {
      throw createError('Timeout Error');
    });
  }
}
