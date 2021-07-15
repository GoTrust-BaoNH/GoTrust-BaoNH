// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'login_mutation_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginMutationGraphql$Mutation$LoginResponse$UserLogin
    extends JsonSerializable with EquatableMixin {
  LoginMutationGraphql$Mutation$LoginResponse$UserLogin();

  factory LoginMutationGraphql$Mutation$LoginResponse$UserLogin.fromJson(
          Map<String, dynamic> json) =>
      _$LoginMutationGraphql$Mutation$LoginResponse$UserLoginFromJson(json);

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
      _$LoginMutationGraphql$Mutation$LoginResponse$UserLoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginMutationGraphql$Mutation$LoginResponse extends JsonSerializable
    with EquatableMixin {
  LoginMutationGraphql$Mutation$LoginResponse();

  factory LoginMutationGraphql$Mutation$LoginResponse.fromJson(
          Map<String, dynamic> json) =>
      _$LoginMutationGraphql$Mutation$LoginResponseFromJson(json);

  String? token;

  LoginMutationGraphql$Mutation$LoginResponse$UserLogin? user;

  late bool registed;

  @override
  List<Object?> get props => [token, user, registed];
  @override
  Map<String, dynamic> toJson() =>
      _$LoginMutationGraphql$Mutation$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginMutationGraphql$Mutation extends JsonSerializable
    with EquatableMixin {
  LoginMutationGraphql$Mutation();

  factory LoginMutationGraphql$Mutation.fromJson(Map<String, dynamic> json) =>
      _$LoginMutationGraphql$MutationFromJson(json);

  LoginMutationGraphql$Mutation$LoginResponse? login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() => _$LoginMutationGraphql$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginMutationGraphqlArguments extends JsonSerializable
    with EquatableMixin {
  LoginMutationGraphqlArguments({this.phoneNumber, this.password});

  @override
  factory LoginMutationGraphqlArguments.fromJson(Map<String, dynamic> json) =>
      _$LoginMutationGraphqlArgumentsFromJson(json);

  final String? phoneNumber;

  final String? password;

  @override
  List<Object?> get props => [phoneNumber, password];
  @override
  Map<String, dynamic> toJson() => _$LoginMutationGraphqlArgumentsToJson(this);
}

final LOGIN_MUTATION_GRAPHQL_MUTATION_DOCUMENT = DocumentNode(definitions: [
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
            variable: VariableNode(name: NameNode(value: 'password')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'phoneNumber'),
                  value: VariableNode(name: NameNode(value: 'phoneNumber'))),
              ArgumentNode(
                  name: NameNode(value: 'password'),
                  value: VariableNode(name: NameNode(value: 'password')))
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

class LoginMutationGraphqlMutation extends GraphQLQuery<
    LoginMutationGraphql$Mutation, LoginMutationGraphqlArguments> {
  LoginMutationGraphqlMutation({required this.variables});

  @override
  final DocumentNode document = LOGIN_MUTATION_GRAPHQL_MUTATION_DOCUMENT;

  @override
  final String operationName = 'login_mutation_graphql';

  @override
  final LoginMutationGraphqlArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  LoginMutationGraphql$Mutation parse(Map<String, dynamic> json) =>
      LoginMutationGraphql$Mutation.fromJson(json);
}
