// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'login_with_auth_mutation_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin
    extends JsonSerializable with EquatableMixin {
  LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin();

  factory LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin.fromJson(
          Map<String, dynamic> json) =>
      _$LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLoginFromJson(
          json);

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
      _$LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLoginToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class LoginWithAuthMutationGraphql$Mutation$LoginResponse
    extends JsonSerializable with EquatableMixin {
  LoginWithAuthMutationGraphql$Mutation$LoginResponse();

  factory LoginWithAuthMutationGraphql$Mutation$LoginResponse.fromJson(
          Map<String, dynamic> json) =>
      _$LoginWithAuthMutationGraphql$Mutation$LoginResponseFromJson(json);

  String? token;

  LoginWithAuthMutationGraphql$Mutation$LoginResponse$UserLogin? user;

  late bool registed;

  @override
  List<Object?> get props => [token, user, registed];
  @override
  Map<String, dynamic> toJson() =>
      _$LoginWithAuthMutationGraphql$Mutation$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginWithAuthMutationGraphql$Mutation extends JsonSerializable
    with EquatableMixin {
  LoginWithAuthMutationGraphql$Mutation();

  factory LoginWithAuthMutationGraphql$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$LoginWithAuthMutationGraphql$MutationFromJson(json);

  LoginWithAuthMutationGraphql$Mutation$LoginResponse? loginOAuth;

  @override
  List<Object?> get props => [loginOAuth];
  @override
  Map<String, dynamic> toJson() =>
      _$LoginWithAuthMutationGraphql$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginWithAuthMutationGraphqlArguments extends JsonSerializable
    with EquatableMixin {
  LoginWithAuthMutationGraphqlArguments({this.provider, this.token});

  @override
  factory LoginWithAuthMutationGraphqlArguments.fromJson(
          Map<String, dynamic> json) =>
      _$LoginWithAuthMutationGraphqlArgumentsFromJson(json);

  final String? provider;

  final String? token;

  @override
  List<Object?> get props => [provider, token];
  @override
  Map<String, dynamic> toJson() =>
      _$LoginWithAuthMutationGraphqlArgumentsToJson(this);
}

final LOGIN_WITH_AUTH_MUTATION_GRAPHQL_MUTATION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: null,
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'provider')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'token')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'loginOAuth'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'provider'),
                  value: VariableNode(name: NameNode(value: 'provider'))),
              ArgumentNode(
                  name: NameNode(value: 'token'),
                  value: VariableNode(name: NameNode(value: 'token')))
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

class LoginWithAuthMutationGraphqlMutation extends GraphQLQuery<
    LoginWithAuthMutationGraphql$Mutation,
    LoginWithAuthMutationGraphqlArguments> {
  LoginWithAuthMutationGraphqlMutation({required this.variables});

  @override
  final DocumentNode document =
      LOGIN_WITH_AUTH_MUTATION_GRAPHQL_MUTATION_DOCUMENT;

  @override
  final String operationName = 'login_with_auth_mutation_graphql';

  @override
  final LoginWithAuthMutationGraphqlArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  LoginWithAuthMutationGraphql$Mutation parse(Map<String, dynamic> json) =>
      LoginWithAuthMutationGraphql$Mutation.fromJson(json);
}
