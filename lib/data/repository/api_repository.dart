import 'dart:async';

import 'package:go_trust/data/common/define_api.dart';
import 'package:go_trust/data/interceptors/graphql_interceptor.dart';
import 'package:go_trust/shared/models/request/login_request.dart';
import 'package:go_trust/shared/models/request/register_request.dart';
import 'package:go_trust/shared/models/response/login_response.dart';
import 'package:go_trust/shared/models/response/register_response.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        break;
      case LoginType.Google:
        final _googleSignIn = GoogleSignIn(
          scopes: [
            'email',
          ],
        );
        try {
          GoogleSignInAccount? account = await _googleSignIn.signIn();
          // TODO: mapping api server and return login response
        } catch (error) {
          print(error);
        }
        break;
      case LoginType.Apple:
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
