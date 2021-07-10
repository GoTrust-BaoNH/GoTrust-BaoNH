import 'package:get/get.dart';
import 'package:go_trust/modules/auth/binding/auth_binding.dart';
import 'package:go_trust/modules/auth/view/create_password_screen.dart';
import 'package:go_trust/modules/auth/view/login_screen.dart';
import 'package:go_trust/modules/auth/view/otp_view.dart';
import 'package:go_trust/modules/auth/view/qr_code_screen.dart';
import 'package:go_trust/modules/auth/view/user_info_screen.dart';
import 'package:go_trust/modules/borrow_data/binding/borrow_data_binding.dart';
import 'package:go_trust/modules/borrow_data/view/borrow_data/borrow_data_screen.dart';
import 'package:go_trust/modules/borrow_data/view/borrow_data_detail/borrow_data_detail.dart';
import 'package:go_trust/modules/emergency/binding/emergency_binding.dart';
import 'package:go_trust/modules/emergency/view/emergency_screen.dart';
import 'package:go_trust/modules/notification/binding/notification_binding.dart';
import 'package:go_trust/modules/notification/view/notification_screen.dart';
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
    page: () => LoginScreen(),
    binding: AuthBinding(),
    children: [
      GetPage(name: Routes.OTP_SCREEN, page: () => OtpScreen()),
      GetPage(name: Routes.CREATE_PASSWORD_SCREEN, page: () => CreatePasswordScreen()),
      GetPage(name: Routes.USER_INFO_SCREEN, page: () => UserInfoScreen()),
      GetPage(name: Routes.QRCODE_SCREEN, page: () => QRCodeScreen()),
    ],
  ),
  GetPage(
    name: Routes.NOTIFICATION_SCREEN,
    page: () => NotificationScreen(),
    binding: NotificationBinding(),
    children: [
      // GetPage(name: Routes.DETAIL_TODO, page: () => DetailTodoScreen()),
    ],
  ),
  GetPage(
    name: Routes.EMERGENCY_SCREEN,
    page: () => EmergencyScreen(),
    binding: EmergencyBinding(),
    children: [
      // GetPage(name: Routes.DETAIL_TODO, page: () => DetailTodoScreen()),
    ],
  ),
  GetPage(
    name: Routes.BORROW_DATA_SCREEN,
    page: () => BorrowDataScreen(),
    binding: BorrowDataBinding(),
    children: [
      GetPage(name: Routes.BORROW_DATA_DETAIL_SCREEN, page: () => BorrowDataDetailScreen()),
    ],
  ),
];
