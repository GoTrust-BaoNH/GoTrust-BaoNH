// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'update_profile_mutation_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateProfileMutationGraphql$Mutation$UserLogin extends JsonSerializable
    with EquatableMixin {
  UpdateProfileMutationGraphql$Mutation$UserLogin();

  factory UpdateProfileMutationGraphql$Mutation$UserLogin.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProfileMutationGraphql$Mutation$UserLoginFromJson(json);

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
      _$UpdateProfileMutationGraphql$Mutation$UserLoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileMutationGraphql$Mutation extends JsonSerializable
    with EquatableMixin {
  UpdateProfileMutationGraphql$Mutation();

  factory UpdateProfileMutationGraphql$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProfileMutationGraphql$MutationFromJson(json);

  UpdateProfileMutationGraphql$Mutation$UserLogin? updateProfile;

  @override
  List<Object?> get props => [updateProfile];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateProfileMutationGraphql$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileMutationGraphqlArguments extends JsonSerializable
    with EquatableMixin {
  UpdateProfileMutationGraphqlArguments(
      {this.email, this.fullName, this.privateId});

  @override
  factory UpdateProfileMutationGraphqlArguments.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateProfileMutationGraphqlArgumentsFromJson(json);

  final String? email;

  final String? fullName;

  final String? privateId;

  @override
  List<Object?> get props => [email, fullName, privateId];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateProfileMutationGraphqlArgumentsToJson(this);
}

final UPDATE_PROFILE_MUTATION_GRAPHQL_MUTATION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: null,
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'email')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'fullName')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'privateId')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updateProfile'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'request'),
                  value: ObjectValueNode(fields: [
                    ObjectFieldNode(
                        name: NameNode(value: 'email'),
                        value: VariableNode(name: NameNode(value: 'email'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'fullName'),
                        value: VariableNode(name: NameNode(value: 'fullName'))),
                    ObjectFieldNode(
                        name: NameNode(value: 'privateId'),
                        value: VariableNode(name: NameNode(value: 'privateId')))
                  ]))
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

class UpdateProfileMutationGraphqlMutation extends GraphQLQuery<
    UpdateProfileMutationGraphql$Mutation,
    UpdateProfileMutationGraphqlArguments> {
  UpdateProfileMutationGraphqlMutation({required this.variables});

  @override
  final DocumentNode document =
      UPDATE_PROFILE_MUTATION_GRAPHQL_MUTATION_DOCUMENT;

  @override
  final String operationName = 'update_profile_mutation_graphql';

  @override
  final UpdateProfileMutationGraphqlArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateProfileMutationGraphql$Mutation parse(Map<String, dynamic> json) =>
      UpdateProfileMutationGraphql$Mutation.fromJson(json);
}
