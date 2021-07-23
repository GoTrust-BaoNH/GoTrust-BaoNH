import 'package:go_trust/data/graphql/query/app_notification_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_category_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_customer_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_faq_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_payment_type_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_policy_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_product_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_promotion_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_brand_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_model_query_graphql.dart';
import 'package:go_trust/shared/models/bank_model/bank_model.dart';
import 'package:go_trust/shared/models/brand_model/brand_model.dart';
import 'package:go_trust/shared/models/category_model/category_list_model.dart';
import 'package:go_trust/shared/models/category_model/category_model.dart';
import 'package:go_trust/shared/models/customer_model/customer_list_model.dart';
import 'package:go_trust/shared/models/customer_model/customer_model.dart';
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
import 'package:go_trust/shared/models/promotion_model/promotion_list_model.dart';
import 'package:go_trust/shared/models/promotion_model/promotion_model.dart';
import 'package:go_trust/shared/models/response/common_response.dart';
import 'package:go_trust/shared/models/users/login_model.dart';
import 'package:go_trust/shared/models/users/user_model.dart';

Error createError(String errorStr) {
  final Error error = ArgumentError(errorStr);
  return error;
}

CommonResponse convertCommonResponseModel(commonResponse) {
  return CommonResponse(
    message: commonResponse.message,
    status: commonResponse.status,
  );
}

LoginModel convertUserLoginModel(loginModel) {
  if (loginModel == null) {
    return LoginModel(registered: false);
  }
  return LoginModel(
    registered: loginModel.registed!,
    token: loginModel.token,
    user: UserModel(
      status: loginModel.user!.status,
      oauthId: loginModel.user!.oauthId,
      oauthProvider: loginModel.user!.oauthProvider,
      qrcodeSecret: loginModel.user!.qrcodeSecret,
      createdDate: loginModel.user!.createdDate,
      email: loginModel.user!.email,
      fullName: loginModel.user!.fullName,
      id: loginModel.user!.id,
      password: loginModel.user!.password,
      phoneNumber: loginModel.user!.phoneNumber,
      privateId: loginModel.user!.privateId,
      updatedDate: loginModel.user!.updatedDate,
      username: loginModel.user!.username,
    ),
  );
}

UserModel convertUserModel(userModel) {
  if (userModel == null) {
    return UserModel(status: 0);
  }
  return UserModel(
    status: userModel!.status,
    oauthId: userModel!.oauthId,
    oauthProvider: userModel!.oauthProvider,
    qrcodeSecret: userModel!.qrcodeSecret,
    createdDate: userModel!.createdDate,
    email: userModel!.email,
    fullName: userModel!.fullName,
    id: userModel!.id,
    password: userModel!.password,
    phoneNumber: userModel!.phoneNumber,
    privateId: userModel!.privateId,
    updatedDate: userModel!.updatedDate,
    username: userModel!.username,
  );
}

List<NotificationItemModel> convertListNotificationModel(listNotification) {
  if (listNotification == null || (listNotification as List).isEmpty) {
    return <NotificationItemModel>[];
  }

  final tempList = <NotificationItemModel>[];
  for (final item in listNotification as List<AppNotificationListQueryGraphql$Query$GraphNotificationListResponse?>) {
    tempList.add(convertItemNotificationModel(item));
  }

  return tempList;
}

NotificationItemModel convertItemNotificationModel(itemNotification) {
  if (itemNotification == null) {
    return NotificationItemModel();
  }
  return NotificationItemModel(
    htmlContent: itemNotification.htmlContent,
    icon: itemNotification.icon,
    id: itemNotification.id,
    isRead: itemNotification.isRead,
    time: itemNotification.time,
    type: itemNotification.type,
  );
}

List<PaymentType> convertListPaymentTypeModel(listPaymentType) {
  if (listPaymentType == null || (listPaymentType as List).isEmpty) {
    return <PaymentType>[];
  }

  final tempList = <PaymentType>[];
  for (final item in listPaymentType as List<GetPaymentTypeListQueryGraphql$Query$PaymentTypeResponse?>) {
    tempList.add(convertItemPaymentTypeModel(item));
  }

  return tempList;
}

PaymentType convertItemPaymentTypeModel(itemPaymentType) {
  if (itemPaymentType == null) {
    return PaymentType();
  }
  return PaymentType(
    id: itemPaymentType.id,
    imageUrl: itemPaymentType.imageUrl,
    title: itemPaymentType.title,
    type: itemPaymentType.type,
  );
}

List<BankModel> convertListPaymentBankModel(listPaymentBank) {
  if (listPaymentBank == null || (listPaymentBank as List).isEmpty) {
    return <BankModel>[];
  }

  final tempList = <BankModel>[];
  for (final item in listPaymentBank) {
    tempList.add(convertItemPaymentBankModel(item));
  }

  return tempList;
}

BankModel convertItemPaymentBankModel(itemPaymentBank) {
  if (itemPaymentBank == null) {
    return BankModel();
  }
  return BankModel(
    code: itemPaymentBank.code,
    id: itemPaymentBank.id,
    imageUrl: itemPaymentBank.imageUrl,
    title: itemPaymentBank.title,
  );
}

CustomerModel convertCustomerModel(customer) {
  if (customer == null) {
    return CustomerModel(id: 0);
  }
  return CustomerModel(
    id: customer.id,
    createdDate: customer.createdDate,
    dateOfBirth: customer.dateOfBirth,
    email: customer.email,
    firstName: customer.firstName,
    lastName: customer.lastName,
    phone: customer.phone,
    updatedDate: customer.updatedDate,
  );
}

EmergencyModel convertEmergencyModel(emergency) {
  if (emergency == null) {
    return EmergencyModel(id: 0);
  }
  return EmergencyModel(
    id: emergency.id,
    address: emergency.address,
    createdDate: emergency.createdDate,
    phone: emergency.phone,
    serviceName: emergency.serviceName,
    updatedDate: emergency.updatedDate,
  );
}

FaqModel convertFaqModel(faq) {
  if (faq == null) {
    return FaqModel(id: 0);
  }
  return FaqModel(
    id: faq.id,
    answer: faq.answer,
    question: faq.question,
  );
}

PolicyModel convertPolicyModel(policy) {
  if (policy == null) {
    return PolicyModel(id: 0);
  }
  return PolicyModel(
    id: policy.id,
    createdDate: policy.createdDate,
    description: policy.description,
    name: policy.name,
    updatedDate: policy.updatedDate,
  );
}

ProductModel convertProductModel(product) {
  if (product == null) {
    return ProductModel(id: 0, categoryId: 0, price: 0);
  }
  return ProductModel(
    id: product.id,
    categoryId: product.categoryId,
    price: product.price,
    code: product.code,
    createdDate: product.createdDate,
    description: product.description,
    name: product.name,
    updatedDate: product.updatedDate,
  );
}

PromotionModel convertPromotionModel(promotion) {
  if (promotion == null) {
    return PromotionModel(id: 0);
  }
  return PromotionModel(
    id: promotion.id,
    code: promotion.code,
    createdDate: promotion.createdDate,
    description: promotion.description,
    name: promotion.name,
    updatedDate: promotion.updatedDate,
  );
}

MotoOrderModel convertMotoOrderModel(motoIns) {
  if (motoIns == null) {
    return MotoOrderModel();
  }
  return MotoOrderModel(
    message: motoIns.message,
    orderId: motoIns.orderId,
    status: motoIns.status,
  );
}

PaymentResponse convertPaymentResponseModel(paymentResponse) {
  if (paymentResponse == null) {
    return PaymentResponse();
  }
  return PaymentResponse(
    code: paymentResponse.code,
    data: paymentResponse.data,
  );
}

CategoryModel convertCategoryModel(categoryModel) {
  if (categoryModel == null) {
    return CategoryModel(id: 0);
  }
  return CategoryModel(
    id: categoryModel.id,
    code: categoryModel.code,
    createdDate: categoryModel.createdDate,
    name: categoryModel.name,
    updatedDate: categoryModel.updatedDate,
  );
}

List<CategoryModel?> convertCategoryListModel(listCategoryModel) {
  if (listCategoryModel == null || (listCategoryModel as List).isEmpty) {
    return <CategoryModel?>[];
  }

  final tempList = <CategoryModel?>[];
  for (final item in listCategoryModel as List<GetCategoryListQueryGraphql$Query$GraphGetCategoryListResponse$Category?>) {
    tempList.add(convertCategoryModel(item));
  }

  return tempList;
}

CategoryListModel convertListCategoryModel(listCategoryModel) {
  if (listCategoryModel == null) {
    return CategoryListModel(pageNumber: 0, pageSize: 0, data: <CategoryModel?>[]);
  }

  return CategoryListModel(
    pageSize: listCategoryModel.pageSize,
    pageNumber: listCategoryModel.pageNumber,
    data: convertCategoryListModel(listCategoryModel.data),
  );
}

CustomerListModel convertListCustomerModel(listCustomerModel) {
  if (listCustomerModel == null) {
    return CustomerListModel(pageNumber: 0, pageSize: 0, data: <CustomerModel?>[]);
  }

  return CustomerListModel(
    pageSize: listCustomerModel.pageSize,
    pageNumber: listCustomerModel.pageNumber,
    data: convertCustomerListModel(listCustomerModel.data),
  );
}

List<CustomerModel?> convertCustomerListModel(listCustomerModel) {
  if (listCustomerModel == null || (listCustomerModel as List).isEmpty) {
    return <CustomerModel?>[];
  }

  final tempList = <CustomerModel?>[];
  for (final item in listCustomerModel as List<GetCustomerListQueryGraphql$Query$GraphGetCustomerListResponse$Customer?>) {
    tempList.add(convertCustomerModel(item));
  }

  return tempList;
}

EmergencyListModel convertListEmergencyModel(listEmergencyModel) {
  if (listEmergencyModel == null) {
    return EmergencyListModel(data: <EmergencyModel>[]);
  }

  return EmergencyListModel(
    data: convertEmergencyListModel(listEmergencyModel.data),
  );
}

List<EmergencyModel> convertEmergencyListModel(listEmergencyModel) {
  if (listEmergencyModel == null || (listEmergencyModel as List).isEmpty) {
    return <EmergencyModel>[];
  }

  final tempList = <EmergencyModel>[];
  for (final item in listEmergencyModel) {
    tempList.add(convertEmergencyModel(item));
  }

  return tempList;
}

FaqListModel convertListFaqListModel(listFaqModel) {
  if (listFaqModel == null) {
    return FaqListModel(pageNumber: 0, pageSize: 0, data: <FaqModel?>[]);
  }

  return FaqListModel(
    pageSize: listFaqModel.pageSize,
    pageNumber: listFaqModel.pageNumber,
    data: convertFaqListModel(listFaqModel.data),
  );
}

List<FaqModel?> convertFaqListModel(listFaqModel) {
  if (listFaqModel == null || (listFaqModel as List).isEmpty) {
    return <FaqModel?>[];
  }

  final tempList = <FaqModel?>[];
  for (final item in listFaqModel as List<GetFaqListQueryGraphql$Query$GraphGetFaqListResponse$Faq?>) {
    tempList.add(convertFaqModel(item));
  }

  return tempList;
}

PolicyListModel convertListPolicyModel(listPolicyModel) {
  if (listPolicyModel == null) {
    return PolicyListModel(pageNumber: 0, pageSize: 0, data: <PolicyModel?>[]);
  }

  return PolicyListModel(
    pageSize: listPolicyModel.pageSize,
    pageNumber: listPolicyModel.pageNumber,
    data: convertPolicyListModel(listPolicyModel.data),
  );
}

List<PolicyModel?> convertPolicyListModel(listPolicyModel) {
  if (listPolicyModel == null || (listPolicyModel as List).isEmpty) {
    return <PolicyModel?>[];
  }

  final tempList = <PolicyModel?>[];
  for (final item in listPolicyModel as List<GetPolicyListQueryGraphql$Query$GraphGetPolicyListResponse$Policy?>) {
    tempList.add(convertPolicyModel(item));
  }

  return tempList;
}

ProductListModel convertListProductModel(listProductModel) {
  if (listProductModel == null) {
    return ProductListModel(pageNumber: 0, pageSize: 0, data: <ProductModel?>[]);
  }

  return ProductListModel(
    pageSize: listProductModel.pageSize,
    pageNumber: listProductModel.pageNumber,
    data: convertProductListModel(listProductModel.data),
  );
}

List<ProductModel?> convertProductListModel(listProductModel) {
  if (listProductModel == null || (listProductModel as List).isEmpty) {
    return <ProductModel?>[];
  }

  final tempList = <ProductModel?>[];
  for (final item in listProductModel as List<GetProductListQueryGraphql$Query$GraphGetProductListResponse$Product?>) {
    tempList.add(convertProductModel(item));
  }

  return tempList;
}

PromotionListModel convertListPromotionModel(listPromotionModel) {
  if (listPromotionModel == null) {
    return PromotionListModel(pageNumber: 0, pageSize: 0, data: <PromotionModel?>[]);
  }

  return PromotionListModel(
    pageSize: listPromotionModel.pageSize,
    pageNumber: listPromotionModel.pageNumber,
    data: convertPromotionListModel(listPromotionModel.data),
  );
}

List<PromotionModel?> convertPromotionListModel(listPromotionModel) {
  if (listPromotionModel == null || (listPromotionModel as List).isEmpty) {
    return <PromotionModel?>[];
  }

  final tempList = <PromotionModel?>[];
  for (final item in listPromotionModel as List<GetPromotionListQueryGraphql$Query$GraphGetPromotionListResponse$Promotion?>) {
    tempList.add(convertPromotionModel(item));
  }

  return tempList;
}

List<BrandModel> convertBrandListModel(listBrandModel) {
  if (listBrandModel == null || (listBrandModel as List).isEmpty) {
    return <BrandModel>[];
  }

  final tempList = <BrandModel>[];
  for (final item in listBrandModel as List<GetRecuseMotoBrandQueryGraphql$Query$GraphRecuseMotoBrandResponse$Brand?>) {
    tempList.add(convertBrandModel(item));
  }

  return tempList;
}

BrandModel convertBrandModel(brandModel) {
  if (brandModel == null) {
    return BrandModel();
  }
  return BrandModel(
    bikeId: brandModel.bikeId,
    bikeName: brandModel.bikeName,
  );
}

List<ModelBikeModel> convertModelBikeListModel(listModelBike) {
  if (listModelBike == null || (listModelBike as List).isEmpty) {
    return <ModelBikeModel>[];
  }

  final tempList = <ModelBikeModel>[];
  for (final item in listModelBike as List<GetRecuseMotoModelQueryGraphql$Query$GraphRecuseMotoModelResponse$Model?>) {
    tempList.add(convertModelBikeModel(item));
  }

  return tempList;
}

ModelBikeModel convertModelBikeModel(modelBike) {
  if (modelBike == null) {
    return ModelBikeModel();
  }
  return ModelBikeModel(
    bikeId: modelBike.bikeId,
    bikeName: modelBike.bikeName,
  );
}
