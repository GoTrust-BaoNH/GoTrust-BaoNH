// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'register_otp_mutation_graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterOtpMutationGraphql$Mutation$OtpResponse
    _$RegisterOtpMutationGraphql$Mutation$OtpResponseFromJson(
        Map<String, dynamic> json) {
  return RegisterOtpMutationGraphql$Mutation$OtpResponse()
    ..message = json['message'] as String?
    ..status = json['status'] as bool;
}

Map<String, dynamic> _$RegisterOtpMutationGraphql$Mutation$OtpResponseToJson(
        RegisterOtpMutationGraphql$Mutation$OtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };

RegisterOtpMutationGraphql$Mutation
    _$RegisterOtpMutationGraphql$MutationFromJson(Map<String, dynamic> json) {
  return RegisterOtpMutationGraphql$Mutation()
    ..registerOtp = json['registerOtp'] == null
        ? null
        : RegisterOtpMutationGraphql$Mutation$OtpResponse.fromJson(
            json['registerOtp'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RegisterOtpMutationGraphql$MutationToJson(
        RegisterOtpMutationGraphql$Mutation instance) =>
    <String, dynamic>{
      'registerOtp': instance.registerOtp?.toJson(),
    };

RegisterOtpMutationGraphqlArguments
    _$RegisterOtpMutationGraphqlArgumentsFromJson(Map<String, dynamic> json) {
  return RegisterOtpMutationGraphqlArguments(
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$RegisterOtpMutationGraphqlArgumentsToJson(
        RegisterOtpMutationGraphqlArguments instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };
