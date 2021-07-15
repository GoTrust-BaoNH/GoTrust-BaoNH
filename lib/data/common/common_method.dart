import 'package:go_trust/data/graphql/mutation/login_with_auth_mutation_graphql.dart';
import 'package:go_trust/shared/models/users/login_model.dart';
import 'package:go_trust/shared/models/users/user_model.dart';

Error createError(String errorStr) {
  final Error error = ArgumentError(errorStr);
  return error;
}

LoginModel convertUserLoginModel(LoginWithAuthMutationGraphql$Mutation$LoginResponse loginModel) {
  return LoginModel(
    registered: loginModel.registed,
    token: loginModel.token,
    user: UserModel(
      status: loginModel.user!.status,
      oauthId: loginModel.user!.oauthId,
      oauthProvider: loginModel.user!.oauthProvider,
      qrcodeSecret: loginModel.user!.qrcodeSecret,
      createdDate: loginModel.user!.createdDate,
      email: loginModel.user!.email,
      fullName: loginModel.user!.fullName,
      id: loginModel.user!.id,
      password: loginModel.user!.password,
      phoneNumber: loginModel.user!.phoneNumber,
      privateId: loginModel.user!.privateId,
      updatedDate: loginModel.user!.updatedDate,
      username: loginModel.user!.username,
    ),
  );
}
