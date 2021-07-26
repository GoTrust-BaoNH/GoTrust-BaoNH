import 'package:go_trust/data/graphql/query/app_notification_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_category_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_customer_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_faq_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_payment_type_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_policy_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_promotion_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_brand_query_graphql.dart';
import 'package:go_trust/data/graphql/query/get_recuse_moto_model_query_graphql.dart';
import 'package:go_trust/data/graphql/mutation/delete_repairing_order_mutation_graphql.dart';
import 'package:go_trust/data/graphql/mutation/create_repairing_order_mutation_graphql.dart';
import 'package:go_trust/shared/models/bank_model/bank_model.dart';
import 'package:go_trust/shared/models/brand_model/brand_model.dart';
import 'package:go_trust/shared/models/category_model/category_list_model.dart';
import 'package:go_trust/shared/models/category_model/category_model.dart';
import 'package:go_trust/shared/models/city_model/city_input_model.dart';
import 'package:go_trust/shared/models/city_model/city_model.dart';
import 'package:go_trust/shared/models/customer_model/customer_list_model.dart';
import 'package:go_trust/shared/models/customer_model/customer_model.dart';
import 'package:go_trust/shared/models/district_model/district_input_model.dart';
import 'package:go_trust/shared/models/district_model/district_model.dart';
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
import 'package:go_trust/shared/models/recuse_order_model/recuse_order_response.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_customer_info_model.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_customer_order_model.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_partner_customer_company_model.dart';
import 'package:go_trust/shared/models/repairing_customer_model/repairing_partner_worker_company_model.dart';
import 'package:go_trust/shared/models/repairing_order/repairing_order_model.dart';
import 'package:go_trust/shared/models/repairing_order/repairing_order_response_model.dart';
import 'package:go_trust/shared/models/repairing_service_model/repairing_image_input_model.dart';
import 'package:go_trust/shared/models/repairing_service_model/repairing_image_model.dart';
import 'package:go_trust/shared/models/repairing_service_model/repairing_service_model.dart';
import 'package:go_trust/shared/models/repairing_service_model/repairing_service_title_model.dart';
import 'package:go_trust/shared/models/response/common_response.dart';
import 'package:go_trust/shared/models/users/login_model.dart';
import 'package:go_trust/shared/models/users/user_model.dart';
import 'package:go_trust/shared/models/ward_model/ward_input_model.dart';
import 'package:go_trust/shared/models/ward_model/ward_model.dart';

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

List<ProductModel> convertProductListModel(listProductModel) {
  if (listProductModel == null || listProductModel.data == null) {
    return <ProductModel>[];
  }

  final tempList = <ProductModel>[];
  for (final item in listProductModel.data) {
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
  if (listBrandModel == null || listBrandModel.data == null) {
    return <BrandModel>[];
  }

  final tempList = <BrandModel>[];
  for (final item in listBrandModel.data as List<GetRecuseMotoBrandQueryGraphql$Query$GraphRecuseMotoBrandResponse$Brand?>) {
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
  if (listModelBike == null || listModelBike.data == null) {
    return <ModelBikeModel>[];
  }

  final tempList = <ModelBikeModel>[];
  for (final item in listModelBike.data as List<GetRecuseMotoModelQueryGraphql$Query$GraphRecuseMotoModelResponse$Model?>) {
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

RecuseOrderModel convertRecuseOrderModel(recuseOrder) {
  if (recuseOrder == null) {
    return RecuseOrderModel(status: 0);
  }

  return RecuseOrderModel(
    message: recuseOrder.message,
    orderId: recuseOrder.orderId,
    status: recuseOrder.status,
  );
}

RepairingOrderResponseModel convertRepairingOrderResponseModel(repairingOrderResponse) {
  if (repairingOrderResponse == null) {
    return RepairingOrderResponseModel(code: 0);
  }

  return RepairingOrderResponseModel(
    code: repairingOrderResponse.code,
    data: convertRepairingOrderModel(repairingOrderResponse.data),
    error: repairingOrderResponse.error,
    message: repairingOrderResponse.message,
  );
}

RepairingOrderModel convertRepairingOrderModel(repairingOrder) {
  if (repairingOrder == null) {
    return RepairingOrderModel(id: 0);
  }

  return RepairingOrderModel(
    city: convertCityModel(repairingOrder.city),
    createdAt: repairingOrder.createdAt,
    customerAddress: repairingOrder.customerAddress,
    customerInfo: convertRepairingCustomerInfoModel(repairingOrder.customerInfo),
    customerName: repairingOrder.customerName,
    customerOrder: convertRepairingCustomerOrderModel(repairingOrder.customerOrder),
    customerPhone: repairingOrder.customerPhone,
    description: repairingOrder.description,
    district: convertDistrictModel(repairingOrder.district),
    externalId: repairingOrder.externalId,
    id: repairingOrder.id,
    images: convertListRepairingImageModel(repairingOrder.images),
    imagesAfterWork: repairingOrder.imagesAfterWork,
    name: repairingOrder.name,
    orderCosts: convertListStringModel(repairingOrder.orderCosts),
    partnerCustomerCompany: convertRepairingPartnerCustomerCompanyModel(repairingOrder.partnerCustomerCompany),
    partnerWorkerCompany: convertRepairingPartnerWorkerCompanyModel(repairingOrder.partnerWorkerCompany),
    publishedAt: repairingOrder.publishedAt,
    service: convertRepairingServiceModel(repairingOrder.service),
    status: repairingOrder.status,
    updatedAt: repairingOrder.updatedAt,
    uuid: repairingOrder.uuid,
    ward: convertWardModel(repairingOrder.ward),
  );
}

RepairingCustomerInfoModel convertRepairingCustomerInfoModel(repairingCustomerInfoModelModel) {
  if (repairingCustomerInfoModelModel == null) {
    return RepairingCustomerInfoModel(id: 0);
  }

  return RepairingCustomerInfoModel(
    id: repairingCustomerInfoModelModel.id,
    address: repairingCustomerInfoModelModel.address,
    avatar: repairingCustomerInfoModelModel.avatar,
    city: convertCityModel(repairingCustomerInfoModelModel.city),
    countryCode: repairingCustomerInfoModelModel.countryCode,
    createdAt: repairingCustomerInfoModelModel.createdAt,
    district: convertDistrictModel(repairingCustomerInfoModelModel.district),
    email: repairingCustomerInfoModelModel.email,
    name: repairingCustomerInfoModelModel.name,
    phone: repairingCustomerInfoModelModel.phone,
    publishedAt: repairingCustomerInfoModelModel.publishedAt,
    referralCode: repairingCustomerInfoModelModel.referralCode,
    referralId: repairingCustomerInfoModelModel.referralId,
    updatedAt: repairingCustomerInfoModelModel.updatedAt,
    uuid: repairingCustomerInfoModelModel.uuid,
    ward: convertWardModel(repairingCustomerInfoModelModel.ward),
  );
}

RepairingCustomerOrderModel convertRepairingCustomerOrderModel(repairingCustomerInfo) {
  if (repairingCustomerInfo == null) {
    return RepairingCustomerOrderModel(id: 0);
  }

  return RepairingCustomerOrderModel(
    id: repairingCustomerInfo.id,
    address: repairingCustomerInfo.address,
    avatar: repairingCustomerInfo.avatar,
    city: convertCityModel(repairingCustomerInfo.city),
    countryCode: repairingCustomerInfo.countryCode,
    createdAt: repairingCustomerInfo.createdAt,
    district: convertDistrictModel(repairingCustomerInfo.district),
    email: repairingCustomerInfo.email,
    name: repairingCustomerInfo.name,
    phone: repairingCustomerInfo.phone,
    publishedAt: repairingCustomerInfo.publishedAt,
    referralCode: repairingCustomerInfo.referralCode,
    referralId: repairingCustomerInfo.referralId,
    updatedAt: repairingCustomerInfo.updatedAt,
    uuid: repairingCustomerInfo.uuid,
    ward: convertWardModel(repairingCustomerInfo.ward),
  );
}

List<RepairingImageModel> convertListRepairingImageModel(listRepairingImage) {
  if (listRepairingImage == null || (listRepairingImage as List).isEmpty) {
    return <RepairingImageModel>[];
  }

  final tempList = <RepairingImageModel>[];
  for (final item in listRepairingImage
      as List<DeleteRepairingOrderMutationGraphql$Mutation$GraphDeleteOrderResponse$RepairingOrder$RepairingImage?>) {
    tempList.add(convertRepairingImageModel(item));
  }

  return tempList;
}

RepairingImageModel convertRepairingImageModel(repairingImageModel) {
  if (repairingImageModel == null) {
    return RepairingImageModel(url: '');
  }

  return RepairingImageModel(
    url: repairingImageModel.url,
    medium: repairingImageModel.medium,
    small: repairingImageModel.small,
    thumbnail: repairingImageModel.thumbnail,
  );
}

dynamic convertListRepairingImageInputModel(listRepairingImageInput) {
  if (listRepairingImageInput == null || (listRepairingImageInput as List).isEmpty) {
    return <RepairingImageInput>[];
  }

  final tempList = <RepairingImageInput>[];
  for (final item in listRepairingImageInput as List<RepairingImageInputModel?>) {
    tempList.add(convertRepairingImageInputModel(item));
  }

  return tempList;
}

RepairingImageInput convertRepairingImageInputModel(repairingImageInputModel) {
  if (repairingImageInputModel == null) {
    return RepairingImageInput();
  }

  return RepairingImageInput(
    url: repairingImageInputModel.url,
    medium: repairingImageInputModel.medium,
    small: repairingImageInputModel.small,
    thumbnail: repairingImageInputModel.thumbnail,
  );
}

List<String?> convertListStringModel(listString) {
  if (listString == null || (listString as List).isEmpty) {
    return <String?>[];
  }

  final tempList = <String?>[];
  // ignore: prefer_foreach
  for (final item in listString) {
    tempList.add(item);
  }

  return tempList;
}

RepairingPartnerCustomerCompanyModel convertRepairingPartnerCustomerCompanyModel(repairingPartnerCustomerCompanyModel) {
  if (repairingPartnerCustomerCompanyModel == null) {
    return RepairingPartnerCustomerCompanyModel(id: 0);
  }

  return RepairingPartnerCustomerCompanyModel(
    id: repairingPartnerCustomerCompanyModel.id,
    address: repairingPartnerCustomerCompanyModel.address,
    album: convertListStringModel(repairingPartnerCustomerCompanyModel.album),
    avatar: convertListStringModel(repairingPartnerCustomerCompanyModel.avatar),
    companyCode: repairingPartnerCustomerCompanyModel.companyCode,
    createdAt: repairingPartnerCustomerCompanyModel.createdAt,
    name: repairingPartnerCustomerCompanyModel.name,
    phone: repairingPartnerCustomerCompanyModel.phone,
    publishedAt: repairingPartnerCustomerCompanyModel.publishedAt,
    updatedAt: repairingPartnerCustomerCompanyModel.updatedAt,
    uuid: repairingPartnerCustomerCompanyModel.uuid,
    customerCompany: repairingPartnerCustomerCompanyModel.customerCompany,
    workerCompany: repairingPartnerCustomerCompanyModel.workerCompany,
  );
}

RepairingPartnerWorkerCompanyModel convertRepairingPartnerWorkerCompanyModel(partnerWorkerCompany) {
  if (partnerWorkerCompany == null) {
    return RepairingPartnerWorkerCompanyModel(id: 0);
  }

  return RepairingPartnerWorkerCompanyModel(
    id: partnerWorkerCompany.id,
    address: partnerWorkerCompany.address,
    album: convertListStringModel(partnerWorkerCompany.album),
    avatar: convertListStringModel(partnerWorkerCompany.avatar),
    companyCode: partnerWorkerCompany.companyCode,
    createdAt: partnerWorkerCompany.createdAt,
    name: partnerWorkerCompany.name,
    phone: partnerWorkerCompany.phone,
    publishedAt: partnerWorkerCompany.publishedAt,
    updatedAt: partnerWorkerCompany.updatedAt,
    uuid: partnerWorkerCompany.uuid,
    customerCompany: partnerWorkerCompany.customerCompany,
    workerCompany: partnerWorkerCompany.workerCompany,
  );
}

RepairingServiceModel convertRepairingServiceModel(repairingServiceModel) {
  if (repairingServiceModel == null) {
    return RepairingServiceModel(id: 0);
  }

  return RepairingServiceModel(
    id: repairingServiceModel.id,
    code: repairingServiceModel.code,
    createdAt: repairingServiceModel.createdAt,
    createdBy: repairingServiceModel.createdBy,
    name: repairingServiceModel.name,
    publishedAt: repairingServiceModel.publishedAt,
    service: convertRepairingServiceModel(repairingServiceModel.service),
    title: convertRepairingServiceTitleModel(repairingServiceModel.title),
    updatedAt: repairingServiceModel.updatedAt,
    updatedBy: repairingServiceModel.updatedBy,
    uuid: repairingServiceModel.uuid,
  );
}

RepairingServiceTitleModel convertRepairingServiceTitleModel(repairingServiceTitleModel) {
  if (repairingServiceTitleModel == null) {
    return RepairingServiceTitleModel(id: 0);
  }

  return RepairingServiceTitleModel(
    id: repairingServiceTitleModel.id,
    en: repairingServiceTitleModel.en,
    vi: repairingServiceTitleModel.vi,
  );
}

CityModel convertCityModel(cityModel) {
  if (cityModel == null) {
    return CityModel();
  }

  return CityModel(
    label: cityModel.label,
    value: cityModel.value,
  );
}

dynamic convertCityInputModel(cityInputModel) {
  if (cityInputModel == null) {
    return CityInput();
  }

  return CityInput(
    label: cityInputModel.label,
    value: cityInputModel.value,
  );
}

DistrictModel convertDistrictModel(districtModel) {
  if (districtModel == null) {
    return DistrictModel();
  }

  return DistrictModel(
    label: districtModel.label,
    value: districtModel.value,
  );
}

dynamic convertDistrictInputModel(districtInputModel) {
  if (districtInputModel == null) {
    return DistrictInput();
  }

  return DistrictInput(
    label: districtInputModel.label,
    value: districtInputModel.value,
  );
}

WardModel convertWardModel(wardModel) {
  if (wardModel == null) {
    return WardModel();
  }

  return WardModel(
    label: wardModel.label,
    value: wardModel.value,
  );
}

dynamic convertWardInputModel(wardInputModel) {
  if (wardInputModel == null) {
    return WardInput();
  }

  return WardInput(
    label: wardInputModel.label,
    value: wardInputModel.value,
  );
}
