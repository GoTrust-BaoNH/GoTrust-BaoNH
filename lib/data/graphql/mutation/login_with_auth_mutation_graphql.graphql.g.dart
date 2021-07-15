// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'login_with_auth_mutation_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin
    _$LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLoginFromJson(
        Map<String, dynamic> json) {
  return LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin()
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

Map<String, dynamic>
    _$LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLoginToJson(
            LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin
                instance) =>
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

LoginWithAuthMutationGraphql$Mutation$LoginResponse
    _$LoginWithAuthMutationGraphql$Mutation$LoginResponseFromJson(
        Map<String, dynamic> json) {
  return LoginWithAuthMutationGraphql$Mutation$LoginResponse()
    ..token = json['token'] as String?
    ..user = json['user'] == null
        ? null
        : LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin
            .fromJson(json['user'] as Map<String, dynamic>)
    ..registed = json['registed'] as bool;
}

Map<String, dynamic>
    _$LoginWithAuthMutationGraphql$Mutation$LoginResponseToJson(
            LoginWithAuthMutationGraphql$Mutation$LoginResponse instance) =>
        <String, dynamic>{
          'token': instance.token,
          'user': instance.user?.toJson(),
          'registed': instance.registed,
        };

LoginWithAuthMutationGraphql$Mutation
    _$LoginWithAuthMutationGraphql$MutationFromJson(Map<String, dynamic> json) {
  return LoginWithAuthMutationGraphql$Mutation()
    ..loginOAuth = json['loginOAuth'] == null
        ? null
        : LoginWithAuthMutationGraphql$Mutation$LoginResponse.fromJson(
            json['loginOAuth'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginWithAuthMutationGraphql$MutationToJson(
        LoginWithAuthMutationGraphql$Mutation instance) =>
    <String, dynamic>{
      'loginOAuth': instance.loginOAuth?.toJson(),
    };

LoginWithAuthMutationGraphqlArguments
    _$LoginWithAuthMutationGraphqlArgumentsFromJson(Map<String, dynamic> json) {
  return LoginWithAuthMutationGraphqlArguments(
    provider: json['provider'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$LoginWithAuthMutationGraphqlArgumentsToJson(
        LoginWithAuthMutationGraphqlArguments instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'token': instance.token,
    };
