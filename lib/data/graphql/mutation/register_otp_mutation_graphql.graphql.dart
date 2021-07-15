// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'register_otp_mutation_graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterOtpMutationGraphql$Mutation$OtpResponse extends JsonSerializable
    with EquatableMixin {
  RegisterOtpMutationGraphql$Mutation$OtpResponse();

  factory RegisterOtpMutationGraphql$Mutation$OtpResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterOtpMutationGraphql$Mutation$OtpResponseFromJson(json);

  String? message;

  late bool status;

  @override
  List<Object?> get props => [message, status];
  @override
  Map<String, dynamic> toJson() =>
      _$RegisterOtpMutationGraphql$Mutation$OtpResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterOtpMutationGraphql$Mutation extends JsonSerializable
    with EquatableMixin {
  RegisterOtpMutationGraphql$Mutation();

  factory RegisterOtpMutationGraphql$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterOtpMutationGraphql$MutationFromJson(json);

  RegisterOtpMutationGraphql$Mutation$OtpResponse? registerOtp;

  @override
  List<Object?> get props => [registerOtp];
  @override
  Map<String, dynamic> toJson() =>
      _$RegisterOtpMutationGraphql$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterOtpMutationGraphqlArguments extends JsonSerializable
    with EquatableMixin {
  RegisterOtpMutationGraphqlArguments({this.phoneNumber});

  @override
  factory RegisterOtpMutationGraphqlArguments.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterOtpMutationGraphqlArgumentsFromJson(json);

  final String? phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
  @override
  Map<String, dynamic> toJson() =>
      _$RegisterOtpMutationGraphqlArgumentsToJson(this);
}

final REGISTER_OTP_MUTATION_GRAPHQL_MUTATION_DOCUMENT =
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
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'registerOtp'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'phoneNumber'),
                  value: VariableNode(name: NameNode(value: 'phoneNumber')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'message'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'status'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class RegisterOtpMutationGraphqlMutation extends GraphQLQuery<
    RegisterOtpMutationGraphql$Mutation, RegisterOtpMutationGraphqlArguments> {
  RegisterOtpMutationGraphqlMutation({required this.variables});

  @override
  final DocumentNode document = REGISTER_OTP_MUTATION_GRAPHQL_MUTATION_DOCUMENT;

  @override
  final String operationName = 'register_otp_mutation_graphql';

  @override
  final RegisterOtpMutationGraphqlArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  RegisterOtpMutationGraphql$Mutation parse(Map<String, dynamic> json) =>
      RegisterOtpMutationGraphql$Mutation.fromJson(json);
}
