// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'update_password_mutation_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordMutationGraphql$Mutation$UserLogin
    _$UpdatePasswordMutationGraphql$Mutation$UserLoginFromJson(
        Map<String, dynamic> json) {
  return UpdatePasswordMutationGraphql$Mutation$UserLogin()
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

Map<String, dynamic> _$UpdatePasswordMutationGraphql$Mutation$UserLoginToJson(
        UpdatePasswordMutationGraphql$Mutation$UserLogin instance) =>
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

UpdatePasswordMutationGraphql$Mutation
    _$UpdatePasswordMutationGraphql$MutationFromJson(
        Map<String, dynamic> json) {
  return UpdatePasswordMutationGraphql$Mutation()
    ..updatePassword = json['updatePassword'] == null
        ? null
        : UpdatePasswordMutationGraphql$Mutation$UserLogin.fromJson(
            json['updatePassword'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdatePasswordMutationGraphql$MutationToJson(
        UpdatePasswordMutationGraphql$Mutation instance) =>
    <String, dynamic>{
      'updatePassword': instance.updatePassword?.toJson(),
    };

UpdatePasswordMutationGraphqlArguments
    _$UpdatePasswordMutationGraphqlArgumentsFromJson(
        Map<String, dynamic> json) {
  return UpdatePasswordMutationGraphqlArguments(
    oldPassword: json['oldPassword'] as String?,
    newPassword: json['newPassword'] as String?,
  );
}

Map<String, dynamic> _$UpdatePasswordMutationGraphqlArgumentsToJson(
        UpdatePasswordMutationGraphqlArguments instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
