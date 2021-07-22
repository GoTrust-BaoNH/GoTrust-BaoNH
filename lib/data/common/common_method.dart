import 'package:go_trust/shared/models/bank_model/bank_model.dart';
import 'package:go_trust/shared/models/notification/notification_item_model.dart';
import 'package:go_trust/shared/models/payment_model/payment_type_model.dart';
import 'package:go_trust/data/graphql/query/app_notification_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/payment_get_bank_list_query_graphql.dart';
import 'package:go_trust/data/graphql/query/payment_get_payment_type_list_query_graphql.dart';
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
  for (final item in listNotification as List<AppNotificationList$Query$AppNotificationListResponse?>) {
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
  for (final item in listPaymentType as List<PaymentGetPaymentTypeList$Query$PaymentTypeResponse?>) {
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
    title: itemPaymentType.title,
    type: itemPaymentType.type,
  );
}

List<BankModel> convertListPaymentBankModel(listPaymentBank) {
  if (listPaymentBank == null || (listPaymentBank as List).isEmpty) {
    return <BankModel>[];
  }

  final tempList = <BankModel>[];
  for (final item in listPaymentBank as List<PaymentGetBankList$Query$BankResponse?>) {
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
    title: itemPaymentBank.title,
  );
}
