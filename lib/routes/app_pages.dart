import 'package:get/get.dart';
import 'package:go_trust/modules/auth/binding/auth_binding.dart';
import 'package:go_trust/modules/auth/view/create_password_screen.dart';
import 'package:go_trust/modules/auth/view/login_screen.dart';
import 'package:go_trust/modules/auth/view/otp_view.dart';
import 'package:go_trust/modules/auth/view/qr_code_screen.dart';
import 'package:go_trust/modules/auth/view/user_info_screen.dart';
import 'package:go_trust/modules/bank/binding/bank_binding.dart';
import 'package:go_trust/modules/bank/view/bank_screen.dart';
import 'package:go_trust/modules/borrow_data/binding/borrow_data_binding.dart';
import 'package:go_trust/modules/borrow_data/view/borrow_data/borrow_data_screen.dart';
import 'package:go_trust/modules/borrow_data/view/borrow_data_detail/borrow_data_detail.dart';
import 'package:go_trust/modules/emergency/binding/emergency_binding.dart';
import 'package:go_trust/modules/emergency/view/emergency_screen.dart';
import 'package:go_trust/modules/home/binding/home_binding.dart';
import 'package:go_trust/modules/home/view/home_screen.dart';
import 'package:go_trust/modules/moto_insurance/binding/moto_insurance_binding.dart';
import 'package:go_trust/modules/moto_insurance/view/moto_insurance_screen.dart';
import 'package:go_trust/modules/moto_rescue/binding/moto_rescue_binding.dart';
import 'package:go_trust/modules/moto_rescue/view/moto_rescue_screen.dart';
import 'package:go_trust/modules/moto_rescue_buy/binding/moto_rescue_buy_binding.dart';
import 'package:go_trust/modules/moto_rescue_buy/view/moto_rescue_buy_screen.dart';
import 'package:go_trust/modules/moto_rescue_checkout/binding/moto_rescue_checkout_binding.dart';
import 'package:go_trust/modules/moto_rescue_checkout/view/moto_rescue_checkout_screen.dart';
import 'package:go_trust/modules/notification/binding/notification_binding.dart';
import 'package:go_trust/modules/notification/view/notification_screen.dart';
import 'package:go_trust/modules/payment_info/binding/payment_info_binding.dart';
import 'package:go_trust/modules/payment_info/view/payment_info_screen.dart';
import 'package:go_trust/modules/payment_method/binding/payment_method_binding.dart';
import 'package:go_trust/modules/payment_method/view/payment_method_screen.dart';
import 'package:go_trust/modules/splash/binding/splash_binding.dart';
import 'package:go_trust/modules/splash/view/splash_screen.dart';
import 'package:go_trust/modules/voucher/binding/home_binding.dart';
import 'package:go_trust/modules/voucher/view/voucher_screen.dart';
import 'package:go_trust/modules/your_product/binding/your_product_binding.dart';
import 'package:go_trust/modules/your_product/view/your_product_screen.dart';

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
  ),
  GetPage(
    name: Routes.EMERGENCY_SCREEN,
    page: () => EmergencyScreen(),
    binding: EmergencyBinding(),
  ),
  GetPage(
    name: Routes.BORROW_DATA_SCREEN,
    page: () => BorrowDataScreen(),
    binding: BorrowDataBinding(),
    children: [
      GetPage(name: Routes.BORROW_DATA_DETAIL_SCREEN, page: () => BorrowDataDetailScreen()),
    ],
  ),
  GetPage(
    name: Routes.HOME,
    page: () => HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.MOTO_INSURANCE_SCREEN,
    page: () => MotoInsuranceScreen(),
    binding: MotoInsuranceBinding(),
  ),
  GetPage(
    name: Routes.MOTO_RESCUE_SCREEN,
    page: () => MotoRescueScreen(),
    binding: MotoRescueBinding(),
  ),
  GetPage(
    name: Routes.MOTO_RESCUE_BUY_SCREEN,
    page: () => MotoRescueBuyScreen(),
    binding: MotoRescueBuyBinding(),
  ),
  GetPage(
    name: Routes.MOTO_RESCUE_CHECKOUT_SCREEN,
    page: () => MotoRescueCheckoutScreen(),
    binding: MotoRescueCheckoutBinding(),
  ),
  GetPage(
    name: Routes.PAYMENT_METHOD_SCREEN,
    page: () => PaymentMethodScreen(),
    binding: PaymentMethodBinding(),
  ),
  GetPage(
    name: Routes.BANK_SCREEN,
    page: () => BankScreen(),
    binding: BankBinding(),
  ),
  GetPage(
    name: Routes.PAYMENT_INFO_SCREEN,
    page: () => PaymentInfoScreen(),
    binding: PaymentInfoBinding(),
  ),
  GetPage(
    name: Routes.YOUR_PRODUCT_SCREEN,
    page: () => YourProductScreen(),
    binding: YourProductBinding(),
  ),
  GetPage(
    name: Routes.VOUCHER_SCREEN,
    page: () => VoucherScreen(),
    binding: VoucherBinding(),
  ),
];
