class UserModel {
  UserModel({
    required this.status,
    this.oauthId,
    this.oauthProvider,
    this.qrcodeSecret,
    this.createdDate,
    this.email,
    this.fullName,
    this.id,
    this.password,
    this.phoneNumber,
    this.privateId,
    this.updatedDate,
    this.username,
  });

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
  int status;
  String? updatedDate;
  String? username;
}
