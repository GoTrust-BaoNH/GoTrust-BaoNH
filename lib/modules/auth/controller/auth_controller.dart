import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_api.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/storage.dart';
import 'package:go_trust/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gotrust_repository_data/data/repository/api_repository.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import 'package:local_auth/local_auth.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends BaseController {
  AuthController({required this.apiRepository});

  final Infrastructure apiRepository;
  final storage = Get.find<SharedPreferences>();
  final LocalAuthentication auth = LocalAuthentication();
  String qrCodeResult = '';
  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? createPinController = TextEditingController();
  final TextEditingController? createRePinController = TextEditingController();
  final TextEditingController? inputPinController = TextEditingController();

  Barcode? result;
  QRViewController? controller;

  @override
  Future<void> onInit() async {
    await super.onInit();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> loginWithSocial(BuildContext context, LoginType loginType) async {
    // var abc = await apiRepository.getHomeItemList();
    var afsa = await apiRepository.getListPaymentBank(paymentType: '1');
    print('fasdfasfasfa');

    // var bcd = await apiRepository.getHomeExtend();
    // print('fasdfasfasfa');


    // final userCredential = await getUserCredential(loginType);
    // if (userCredential == null) {
    //   showError(content: 'error_login_social'.tr);
    // } else {
    //   try {
    //     await EasyLoading.show();
    //     final loginModel = await apiRepository.getLoginUserWithAuth(provider: userCredential.credential!.providerId, token: await userCredential.user!.getIdToken());
    //     await EasyLoading.dismiss();
    //     if (loginModel.token != null) {
    //       await storage.setString(StorageConstants.token, loginModel.token!);
    //       await Get.toNamed(Routes.AUTH + Routes.CREATE_PIN_SCREEN);
    //     } else {
    //       await callDialogErrorNetwork();
    //     }
    //   } catch (ex) {
    //     print('Login fail with error: $ex');
    //     showError(content: ex.toString());
    //   } finally {
    //     if (EasyLoading.isShow) {
    //       await EasyLoading.dismiss();
    //     }
    //   }
    // }
  }

  Future<UserCredential?> getUserCredential(LoginType loginType) async {
    switch (loginType) {
      case LoginType.UserNamePassWord:
        break;
      case LoginType.PhoneNumber:
        break;
      case LoginType.QrCode:
        break;
      case LoginType.Facebook:
        return await fbLoginProvider();
      case LoginType.Google:
        return await googleLoginProvider();
      case LoginType.Apple:
        return await appleLoginProvider();
      default:
    }
  }

  Future<UserCredential?> fbLoginProvider() async {
    try {
      // Trigger the sign-in flow
      final result = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (ex) {
      print(ex);
      showError(content: ex.toString());
      return null;
    }
  }

  Future<UserCredential?> googleLoginProvider() async {
    try {
      // Trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final googleAuth = await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (ex) {
      print(ex);
      showError(content: ex.toString());
      return null;
    }
  }

  Future<UserCredential?> appleLoginProvider() async {
    try {
      if (Platform.isAndroid) {
        return null;
      }
      // To prevent replay attacks with the credential returned from Apple, we
      // include a nonce in the credential request. When signing in with
      // Firebase, the nonce in the id token returned by Apple, is expected to
      // match the sha256 hash of `rawNonce`.
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    } catch (ex) {
      print(ex);
      showError(content: ex.toString());
      return null;
    }
  }

  void showError({required String content}) {
    Get.snackbar(
      'error'.tr,
      content,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void goToVerifyOTP() {
    Get.offAllNamed(Routes.AUTH + Routes.OTP_SCREEN);
  }

  // ignore: unused_element
  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      await _handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  Future<void> _handleEventDialog(String? defineEvent) async {
    switch (defineEvent) {
      default:
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> registerOTP() async {
    // if (phoneController!.text.isNotEmpty) {
    //   final loginModel = await apiRepository.registerOTP(phoneNumber: phoneController!.text);
    //   if (loginModel.status ?? false) {
    //     goToVerifyOTP();
    //   } else {
    //     await callDialogErrorNetwork();
    //   }
    // }
  }

  Future<void> savePinStorage() async {
    if (!validatePin()) {
      showError(content: 'Mã PIN không hợp lệ');
      print('not valid');
      return;
    }

    final result = await storage.setString(StorageConstants.pin, createPinController!.text);
    if (result) {
      await Get.offAllNamed(Routes.HOME);
    } else {
      showError(content: 'Không thể lưu mã PIN');
    }
  }

  bool validatePin() {
    return createPinController!.text.isNotEmpty && (createPinController!.text == createRePinController!.text);
  }

  void loginWithPin() {
    final pin = storage.getString(StorageConstants.pin) ?? '';
    if (inputPinController!.text == pin) {
      Get.offAllNamed(Routes.HOME);
    } else {
      showError(content: 'Mã PIN nhập không đúng');
    }
  }

  bool isUseBiometric() {
    return storage.getBool(StorageConstants.use_biometric) ?? false;
  }

  Future<void> loginWithBiometric() async {
    final authenticate = await auth.authenticate(localizedReason: 'Chạm để đăng nhập', biometricOnly: true);
    if (authenticate) {
      await Get.offAllNamed(Routes.HOME);
    } else {
      showError(content: 'Đăng nhập bằng sinh trắc học thất bại');
    }
  }
}
