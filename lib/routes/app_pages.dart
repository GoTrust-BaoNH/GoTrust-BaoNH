import 'package:get/get.dart';
import 'package:go_trust/modules/auth/binding/auth_binding.dart';
import 'package:go_trust/modules/auth/view/auth_screen.dart';
import 'package:go_trust/modules/auth/view/login_screen.dart';
import 'package:go_trust/modules/auth/view/register_screen.dart';
import 'package:go_trust/modules/detail_todo/view/detail_todo_screen.dart';
import 'package:go_trust/modules/home/binding/home_binding.dart';
import 'package:go_trust/modules/home/view/home_screen.dart';
import 'package:go_trust/modules/splash/binding/splash_binding.dart';
import 'package:go_trust/modules/splash/view/splash_screen.dart';

part 'app_routes.dart';

const INITIAL = Routes.SPLASH;

final routePages = [
  GetPage(
    name: Routes.SPLASH,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.AUTH,
    page: () => AuthScreen(),
    binding: AuthBinding(),
    children: [
      GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
      GetPage(name: Routes.LOGIN, page: () => LoginScreen()),
    ],
  ),
  GetPage(
    name: Routes.HOME,
    page: () => HomeScreen(),
    binding: HomeBinding(),
    children: [
      GetPage(name: Routes.DETAIL_TODO, page: () => DetailTodoScreen()),
    ],
  ),
];
