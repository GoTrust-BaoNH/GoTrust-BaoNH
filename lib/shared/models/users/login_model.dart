import 'package:go_trust/shared/models/users/user_model.dart';

class LoginModel {
  LoginModel({
    required this.registered,
    this.token,
    this.user,
  });

  String? token;
  UserModel? user;
  bool registered;
}
