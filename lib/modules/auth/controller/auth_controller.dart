import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_api.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../data/repository/api_repository.dart';

class AuthController extends BaseController {
  AuthController({required this.apiRepository});

  final ApiRepository apiRepository;
  String qrCodeResult = '';
  final TextEditingController? phoneController = TextEditingController();

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
    UserCredential? userCredential;
    switch (loginType) {
      case LoginType.UserNamePassWord:
        break;
      case LoginType.PhoneNumber:
        break;
      case LoginType.QrCode:
        break;
      case LoginType.Facebook:
        try {
          // Trigger the sign-in flow
          final result = await FacebookAuth.instance.login();

          // Create a credential from the access token
          final facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

          // Once signed in, return the UserCredential
          userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
        } catch (error) {
          print(error);
        }
        break;
      case LoginType.Google:
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
          userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        } catch (error) {
          print(error);
        }
        break;
      case LoginType.Apple:
        try {
          if (Platform.isAndroid) {
            break;
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
          userCredential = await FirebaseAuth.instance.signInWithCredential(oauthCredential);
        } catch (error) {
          print(error);
        }
        break;
      default:
    }

    if (userCredential == null) {
      await callDialogErrorNetwork();
    } else {
      final loginModel = await apiRepository.getLoginUserWithAuth(provider: userCredential.credential!.providerId, token: await userCredential.user!.getIdToken());
      if (loginModel.token != null) {
        goToHome();
      } else {
        await callDialogErrorNetwork();
      }
    }
  }

  void goToHome() {
    Get.offAllNamed(Routes.HOME);
  }

  void goToVerifyOTP() {
    Get.offAllNamed(Routes.AUTH + Routes.OTP_SCREEN);
  }

  Future<void> scanQRCode() async {
    try {
      qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#FFFB6107',
        'Cancel',
        true, //show flash icon
        ScanMode.QR,
      );
    } on PlatformException {
      qrCodeResult = 'Failed to get platform version.';
    }
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
    if (phoneController!.text.isNotEmpty) {
      final loginModel = await apiRepository.registerOTP(phoneNumber: phoneController!.text);
      if (loginModel.status ?? false) {
        goToVerifyOTP();
      } else {
        await callDialogErrorNetwork();
      }
    }
  }
}
