// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'update_profile_mutation_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileMutationGraphql$Mutation$UserLogin
    _$UpdateProfileMutationGraphql$Mutation$UserLoginFromJson(
        Map<String, dynamic> json) {
  return UpdateProfileMutationGraphql$Mutation$UserLogin()
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

Map<String, dynamic> _$UpdateProfileMutationGraphql$Mutation$UserLoginToJson(
        UpdateProfileMutationGraphql$Mutation$UserLogin instance) =>
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

UpdateProfileMutationGraphql$Mutation
    _$UpdateProfileMutationGraphql$MutationFromJson(Map<String, dynamic> json) {
  return UpdateProfileMutationGraphql$Mutation()
    ..updateProfile = json['updateProfile'] == null
        ? null
        : UpdateProfileMutationGraphql$Mutation$UserLogin.fromJson(
            json['updateProfile'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateProfileMutationGraphql$MutationToJson(
        UpdateProfileMutationGraphql$Mutation instance) =>
    <String, dynamic>{
      'updateProfile': instance.updateProfile?.toJson(),
    };

UpdateProfileMutationGraphqlArguments
    _$UpdateProfileMutationGraphqlArgumentsFromJson(Map<String, dynamic> json) {
  return UpdateProfileMutationGraphqlArguments(
    email: json['email'] as String?,
    fullName: json['fullName'] as String?,
    privateId: json['privateId'] as String?,
  );
}

Map<String, dynamic> _$UpdateProfileMutationGraphqlArgumentsToJson(
        UpdateProfileMutationGraphqlArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'privateId': instance.privateId,
    };
