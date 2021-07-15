// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'login_mutation_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginMutationGraphql$Mutation$LoginResponse$UserLogin
    _$LoginMutationGraphql$Mutation$LoginResponse$UserLoginFromJson(
        Map<String, dynamic> json) {
  return LoginMutationGraphql$Mutation$LoginResponse$UserLogin()
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
    _$LoginMutationGraphql$Mutation$LoginResponse$UserLoginToJson(
            LoginMutationGraphql$Mutation$LoginResponse$UserLogin instance) =>
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

LoginMutationGraphql$Mutation$LoginResponse
    _$LoginMutationGraphql$Mutation$LoginResponseFromJson(
        Map<String, dynamic> json) {
  return LoginMutationGraphql$Mutation$LoginResponse()
    ..token = json['token'] as String?
    ..user = json['user'] == null
        ? null
        : LoginMutationGraphql$Mutation$LoginResponse$UserLogin.fromJson(
            json['user'] as Map<String, dynamic>)
    ..registed = json['registed'] as bool;
}

Map<String, dynamic> _$LoginMutationGraphql$Mutation$LoginResponseToJson(
        LoginMutationGraphql$Mutation$LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user?.toJson(),
      'registed': instance.registed,
    };

LoginMutationGraphql$Mutation _$LoginMutationGraphql$MutationFromJson(
    Map<String, dynamic> json) {
  return LoginMutationGraphql$Mutation()
    ..login = json['login'] == null
        ? null
        : LoginMutationGraphql$Mutation$LoginResponse.fromJson(
            json['login'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoginMutationGraphql$MutationToJson(
        LoginMutationGraphql$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login?.toJson(),
    };

LoginMutationGraphqlArguments _$LoginMutationGraphqlArgumentsFromJson(
    Map<String, dynamic> json) {
  return LoginMutationGraphqlArguments(
    phoneNumber: json['phoneNumber'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$LoginMutationGraphqlArgumentsToJson(
        LoginMutationGraphqlArguments instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
