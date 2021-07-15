// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'verify_otp_mutation_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin
    _$VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLoginFromJson(
        Map<String, dynamic> json) {
  return VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin()
    ..oauthId = json['oauthId'] as String?
    ..oauthProvider = json['oauthProvider'] as String?
    ..qrcodeSecret = json['qrcodeSecret'] as String?
    ..createdDate = json['createdDate'] as String?
    ..email = json['email'] as String?
    ..fullName = json['fullName'] as String?
    ..id = json['id'] as int?
    ..password = json['password'] as String?
    ..phoneNumber = json['phoneNumber'] as String?
    ..privateId = json['privateId'] as String?
    ..status = json['status'] as int
    ..updatedDate = json['updatedDate'] as String?
    ..username = json['username'] as String?;
}

Map<String,
    dynamic> _$VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLoginToJson(
        VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin instance) =>
    <String, dynamic>{
      'oauthId': instance.oauthId,
      'oauthProvider': instance.oauthProvider,
      'qrcodeSecret': instance.qrcodeSecret,
      'createdDate': instance.createdDate,
      'email': instance.email,
      'fullName': instance.fullName,
      'id': instance.id,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'privateId': instance.privateId,
      'status': instance.status,
      'updatedDate': instance.updatedDate,
      'username': instance.username,
    };

VerifyOtpMutationGraphql$Mutation$LoginResponse
    _$VerifyOtpMutationGraphql$Mutation$LoginResponseFromJson(
        Map<String, dynamic> json) {
  return VerifyOtpMutationGraphql$Mutation$LoginResponse()
    ..token = json['token'] as String?
    ..user = json['user'] == null
        ? null
        : VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin.fromJson(
            json['user'] as Map<String, dynamic>)
    ..registed = json['registed'] as bool;
}

Map<String, dynamic> _$VerifyOtpMutationGraphql$Mutation$LoginResponseToJson(
        VerifyOtpMutationGraphql$Mutation$LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user?.toJson(),
      'registed': instance.registed,
    };

VerifyOtpMutationGraphql$Mutation _$VerifyOtpMutationGraphql$MutationFromJson(
    Map<String, dynamic> json) {
  return VerifyOtpMutationGraphql$Mutation()
    ..verifyOtp = json['verifyOtp'] == null
        ? null
        : VerifyOtpMutationGraphql$Mutation$LoginResponse.fromJson(
            json['verifyOtp'] as Map<String, dynamic>);
}

Map<String, dynamic> _$VerifyOtpMutationGraphql$MutationToJson(
        VerifyOtpMutationGraphql$Mutation instance) =>
    <String, dynamic>{
      'verifyOtp': instance.verifyOtp?.toJson(),
    };

VerifyOtpMutationGraphqlArguments _$VerifyOtpMutationGraphqlArgumentsFromJson(
    Map<String, dynamic> json) {
  return VerifyOtpMutationGraphqlArguments(
    phoneNumber: json['phoneNumber'] as String?,
    otp: json['otp'] as String?,
  );
}

Map<String, dynamic> _$VerifyOtpMutationGraphqlArgumentsToJson(
        VerifyOtpMutationGraphqlArguments instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
    };
