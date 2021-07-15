// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'verify_otp_mutation_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin
    extends JsonSerializable with EquatableMixin {
  VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin();

  factory VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLoginFromJson(json);

  String? oauthId;

  String? oauthProvider;

  String? qrcodeSecret;

  String? createdDate;

  String? email;

  String? fullName;

  int? id;

  String? password;

  String? phoneNumber;

  String? privateId;

  late int status;

  String? updatedDate;

  String? username;

  @override
  List<Object?> get props => [
        oauthId,
        oauthProvider,
        qrcodeSecret,
        createdDate,
        email,
        fullName,
        id,
        password,
        phoneNumber,
        privateId,
        status,
        updatedDate,
        username
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyOtpMutationGraphql$Mutation$LoginResponse extends JsonSerializable
    with EquatableMixin {
  VerifyOtpMutationGraphql$Mutation$LoginResponse();

  factory VerifyOtpMutationGraphql$Mutation$LoginResponse.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyOtpMutationGraphql$Mutation$LoginResponseFromJson(json);

  String? token;

  VerifyOtpMutationGraphql$Mutation$LoginResponse$UserLogin? user;

  late bool registed;

  @override
  List<Object?> get props => [token, user, registed];
  @override
  Map<String, dynamic> toJson() =>
      _$VerifyOtpMutationGraphql$Mutation$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyOtpMutationGraphql$Mutation extends JsonSerializable
    with EquatableMixin {
  VerifyOtpMutationGraphql$Mutation();

  factory VerifyOtpMutationGraphql$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyOtpMutationGraphql$MutationFromJson(json);

  VerifyOtpMutationGraphql$Mutation$LoginResponse? verifyOtp;

  @override
  List<Object?> get props => [verifyOtp];
  @override
  Map<String, dynamic> toJson() =>
      _$VerifyOtpMutationGraphql$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyOtpMutationGraphqlArguments extends JsonSerializable
    with EquatableMixin {
  VerifyOtpMutationGraphqlArguments({this.phoneNumber, this.otp});

  @override
  factory VerifyOtpMutationGraphqlArguments.fromJson(
          Map<String, dynamic> json) =>
      _$VerifyOtpMutationGraphqlArgumentsFromJson(json);

  final String? phoneNumber;

  final String? otp;

  @override
  List<Object?> get props => [phoneNumber, otp];
  @override
  Map<String, dynamic> toJson() =>
      _$VerifyOtpMutationGraphqlArgumentsToJson(this);
}

final VERIFY_OTP_MUTATION_GRAPHQL_MUTATION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: null,
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'phoneNumber')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'otp')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'verifyOtp'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'phoneNumber'),
                  value: VariableNode(name: NameNode(value: 'phoneNumber'))),
              ArgumentNode(
                  name: NameNode(value: 'otp'),
                  value: VariableNode(name: NameNode(value: 'otp')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'token'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'user'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'oauthId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'oauthProvider'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'qrcodeSecret'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'createdDate'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'email'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'fullName'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'password'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'phoneNumber'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'privateId'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'status'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'updatedDate'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'username'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'registed'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class VerifyOtpMutationGraphqlMutation extends GraphQLQuery<
    VerifyOtpMutationGraphql$Mutation, VerifyOtpMutationGraphqlArguments> {
  VerifyOtpMutationGraphqlMutation({required this.variables});

  @override
  final DocumentNode document = VERIFY_OTP_MUTATION_GRAPHQL_MUTATION_DOCUMENT;

  @override
  final String operationName = 'verify_otp_mutation_graphql';

  @override
  final VerifyOtpMutationGraphqlArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  VerifyOtpMutationGraphql$Mutation parse(Map<String, dynamic> json) =>
      VerifyOtpMutationGraphql$Mutation.fromJson(json);
}
