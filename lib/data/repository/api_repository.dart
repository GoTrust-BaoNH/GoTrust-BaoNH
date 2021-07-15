import 'dart:async';
import 'dart:io';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_trust/data/common/define_api.dart';
import 'package:go_trust/data/interceptors/graphql_interceptor.dart';
import 'package:go_trust/shared/models/request/login_request.dart';
import 'package:go_trust/shared/models/request/register_request.dart';
import 'package:go_trust/shared/models/response/login_response.dart';
import 'package:go_trust/shared/models/response/register_response.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../data/graphql/query/demo_query_graphql.dart';
import '../../data/service/api_provider.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<LoginResponse?> login(LoginType loginType, LoginRequest data) async {
    switch (loginType) {
      case LoginType.UserNamePassWord:
        break;
      case LoginType.PhoneNumber:
        break;
      case LoginType.QrCode:
        break;
      case LoginType.Facebook:
        try {
          final result = await FacebookAuth.instance.login(permissions: [
            'email',
            'public_profile',
            'user_photos',
          ]);

          if (result.status == LoginStatus.success) {
            Map<String, dynamic>? _userData = await FacebookAuth.instance.getUserData(
              fields: "name,email,picture.width(200),photos",
            );
            // FacebookAuth.instance.logOut();
            // TODO: mapping api server and return login response
          }
        } catch (error) {
          print(error);
        }
        break;
      case LoginType.Google:
        try {
          final _googleSignIn = GoogleSignIn(
            scopes: [
              'email',
            ],
          );

          GoogleSignInAccount? account = await _googleSignIn.signIn();
          //_googleSignIn.signOut();
          // TODO: mapping api server and return login response
        } catch (error) {
          print(error);
        }
        break;
      case LoginType.Apple:
        try {
          final credential = await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
            webAuthenticationOptions: WebAuthenticationOptions(
              // TODO: Set the `clientId` and `redirectUri` arguments to the values you entered in the Apple Developer portal during the setup
              clientId: 'com.go.trust.gotrust.test',
              redirectUri: Uri.parse(
                'https://flutter-sign-in-with-apple-example.glitch.me/callbacks/sign_in_with_apple',
              ),
            ),
            // TODO: Remove these if you have no need for them
            nonce: 'example-nonce',
            state: 'example-state',
          );
          print(credential);

          // This is the endpoint that will convert an authorization code obtained
          // via Sign in with Apple into a session in your system
          final signInWithAppleEndpoint = Uri(
            scheme: 'https',
            host: 'flutter-sign-in-with-apple-example.glitch.me',
            path: '/sign_in_with_apple',
            queryParameters: <String, String>{
              'code': credential.authorizationCode,
              if (credential.givenName != null) 'firstName': credential.givenName!,
              if (credential.familyName != null) 'lastName': credential.familyName!,
              'useBundleId': Platform.isIOS || Platform.isMacOS ? 'true' : 'false',
              if (credential.state != null) 'state': credential.state!,
            },
          );

          final session = await http.Client().post(
            signInWithAppleEndpoint,
          );

          // If we got this far, a session based on the Apple ID credential has been created in your system,
          // and you can now set this as the app's session
          print(session);
        } catch (error) {
          print(error);
        }
        break;
      default:
    }

    // final res = await apiProvider.login(LOGIN_URN, data);
    // if (res.statusCode == 200) {
    //   return LoginResponse.fromJson(res.body);
    // }
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register(REGISTER_URN, data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<List<GetActiveTodos$Query$TodosSelectColumn>> getList({required int limit, required int offset}) async {
    final c = Completer<List<GetActiveTodos$Query$TodosSelectColumn>>();
    try {
      final results = await apiProvider.getListTodo(limit: limit, offset: offset);
      if (!results.hasException) {
        final listTodo = GetActiveTodos$Query.fromJson(results.data!).todos;
        c.complete(listTodo);
      } else {
        print('Exception: ${results.exception}');
        c.completeError(handleErrorGraphQL(results.exception!));
      }
    } catch (ex, stackTrace) {
      print(stackTrace.toString());
      c.completeError(ex.toString());
    }

    return c.future;
  }
}
