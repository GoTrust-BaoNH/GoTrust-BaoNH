// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'update_password_mutation_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdatePasswordMutationGraphql$Mutation$UserLogin extends JsonSerializable
    with EquatableMixin {
  UpdatePasswordMutationGraphql$Mutation$UserLogin();

  factory UpdatePasswordMutationGraphql$Mutation$UserLogin.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePasswordMutationGraphql$Mutation$UserLoginFromJson(json);

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
      _$UpdatePasswordMutationGraphql$Mutation$UserLoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatePasswordMutationGraphql$Mutation extends JsonSerializable
    with EquatableMixin {
  UpdatePasswordMutationGraphql$Mutation();

  factory UpdatePasswordMutationGraphql$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePasswordMutationGraphql$MutationFromJson(json);

  UpdatePasswordMutationGraphql$Mutation$UserLogin? updatePassword;

  @override
  List<Object?> get props => [updatePassword];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatePasswordMutationGraphql$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatePasswordMutationGraphqlArguments extends JsonSerializable
    with EquatableMixin {
  UpdatePasswordMutationGraphqlArguments({this.oldPassword, this.newPassword});

  @override
  factory UpdatePasswordMutationGraphqlArguments.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatePasswordMutationGraphqlArgumentsFromJson(json);

  final String? oldPassword;

  final String? newPassword;

  @override
  List<Object?> get props => [oldPassword, newPassword];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatePasswordMutationGraphqlArgumentsToJson(this);
}

final UPDATE_PASSWORD_MUTATION_GRAPHQL_MUTATION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: null,
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'oldPassword')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'newPassword')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updatePassword'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'oldPassword'),
                  value: VariableNode(name: NameNode(value: 'oldPassword'))),
              ArgumentNode(
                  name: NameNode(value: 'newPassword'),
                  value: VariableNode(name: NameNode(value: 'newPassword')))
            ],
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
            ]))
      ]))
]);

class UpdatePasswordMutationGraphqlMutation extends GraphQLQuery<
    UpdatePasswordMutationGraphql$Mutation,
    UpdatePasswordMutationGraphqlArguments> {
  UpdatePasswordMutationGraphqlMutation({required this.variables});

  @override
  final DocumentNode document =
      UPDATE_PASSWORD_MUTATION_GRAPHQL_MUTATION_DOCUMENT;

  @override
  final String operationName = 'update_password_mutation_graphql';

  @override
  final UpdatePasswordMutationGraphqlArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdatePasswordMutationGraphql$Mutation parse(Map<String, dynamic> json) =>
      UpdatePasswordMutationGraphql$Mutation.fromJson(json);
}
