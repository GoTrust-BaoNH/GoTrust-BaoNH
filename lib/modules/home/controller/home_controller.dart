import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/resource/assets_constant/icon_constants.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_links/uni_links.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class HomeController extends BaseController {
  HomeController({required this.apiRepository});

  final ApiRepository apiRepository;

  final listPromotion = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKw8SFwNN-d4aDhHsFD2arg4PcKDjnxXYkug&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhb-UXbs_MKW_SM3dhe8JkXkgHr77d9jr6Xg&usqp=CAU',
  ];

  final itemData = [
    {'icon': IconConstants.goTrustLive, 'title': 'GoTrust Live!'},
    {'icon': IconConstants.goTrustCyber, 'title': 'GoTrust Cyber'},
    {'icon': IconConstants.onlineShopping, 'title': 'GoTrust Online Shopping'},
    {'icon': IconConstants.bhXeMay, 'title': 'Bảo hiểm xe máy'},
    {'icon': IconConstants.bhOto, 'title': 'Bảo hiểm ô tô'},
    {'icon': IconConstants.taiNan, 'title': 'Bảo hiểm tai nạn 24/7'},
    {'icon': IconConstants.sucKhoeVang, 'title': 'Bảo hiểm sức khỏe vàng'},
    {'icon': IconConstants.goTrustCare, 'title': 'Bảo hiểm GoTrust Care'},
    {'icon': IconConstants.treChuyenBay, 'title': 'Bảo hiểm trễ chuyến bay'},
    {'icon': IconConstants.cuuHoXeMay, 'title': 'Cứu hộ xe máy 24/7'},
    {'icon': IconConstants.cuuHoOto, 'title': 'Cứu hộ ô tô 24/7 '},
    {'icon': IconConstants.khamBenh, 'title': 'Khám bệnh online 24/7'},
  ];

  final emergencyData = [
    {'icon': IconConstants.cuuHoXeMay, 'title': 'Cứu hộ xe máy 24/7'},
    {'icon': IconConstants.cuuHoOto, 'title': 'Cứu hộ ô tô 24/7 '},
    {'icon': IconConstants.khamBenh, 'title': 'Gọi bác sĩ'},
    {'icon': IconConstants.ic4g, 'title': 'Nạp data 4g'},
  ];

  final List<Map<String, dynamic>> bestSellerItem = [
    {'icon': IconConstants.cuuHoXeMay, 'title': 'Cứu hộ xe máy 24/7', 'image': 'https://cdn.honda.com.vn/motorbikes/January2020/M4GRJvkB8BU2L6fHpATX.png'},
    {
      'icon': IconConstants.sucKhoeVang,
      'title': 'Bảo hiểm sức khỏe vàng',
      'image': 'https://duocphamhvqy.com.vn/wp-content/uploads/2018/12/nguyen-ngoc-nhan-suc-khoe-la-vang.jpg'
    },
    {'icon': IconConstants.onlineShopping, 'title': 'GoTrust Online Shopping', 'image': 'https://webdoctor.vn/wp-content/uploads/2017/07/online-shopping-ecommerce-ss-1920.png'},
    {'icon': IconConstants.treChuyenBay, 'title': 'Bảo hiểm trễ chuyến bay', 'image': 'https://www.vietnamairlinesgiare.vn/wp-content/uploads/2015/03/vietnam-airlines1.jpg'},
  ];

  final List<String> listPartner = [
    ImageConstants.hdInsurance,
    ImageConstants.bhBuuDien,
    ImageConstants.bhBaoViet,
  ];

  final ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    await super.onInit();
    receiveFromAnotherApp();
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  void onHomeItemPressed(String item) {
    switch (item) {
      case IconConstants.goTrustLive:
        Get.toNamed(Routes.SETTINGS_SCREEN);
        break;
      case IconConstants.goTrustCyber:
        break;
      case IconConstants.onlineShopping:
        break;
      case IconConstants.bhXeMay:
        Get.toNamed(Routes.MOTO_INSURANCE_SCREEN);
        break;
      case IconConstants.bhOto:
        break;
      case IconConstants.taiNan:
        break;
      case IconConstants.sucKhoeVang:
        break;
      case IconConstants.goTrustCare:
        break;
      case IconConstants.treChuyenBay:
        break;
      case IconConstants.cuuHoXeMay:
        Get.toNamed(Routes.MOTO_RESCUE_BUY_SCREEN);
        break;
      case IconConstants.cuuHoOto:
        Get.toNamed(Routes.VOUCHER_SCREEN);
        break;
      case IconConstants.khamBenh:
        break;
      case IconConstants.ic4g:
        Get.toNamed(Routes.BORROW_DATA_SCREEN);
        break;
      default:
    }
  }

  Future<void> _doShowDialog(CommonDialogRequest dialogRequest) async {
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showDialog(dialogRequest);

    if (dialogResult.confirmed) {
      print('User press confirm');
      handleEventDialog(dialogRequest.defineEvent);
    } else {
      print('User press cancel!');
    }
  }

  void handleEventDialog(String? defineEvent) {
    switch (defineEvent) {
      case NO_CONNECT_NETWORK:
        checkConnectNetwork();
        break;
      default:
        break;
    }
  }

  void changeTheme() {
    Get.find<SharedPreferences>().setString(StorageConstants.theme, Get.isDarkMode ? LIGHT_THEME : DARK_THEME);
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  Future<void> changeLanguage() async {
    final prefs = Get.find<SharedPreferences>();
    final language = prefs.getString(StorageConstants.language);
    final locator = Get.find<DialogService>();
    final dialogResult = await locator.showLanguageDialog(
      languages: const [VIETNAMESE_LANG, ENGLISH_LANG],
      isMustTapButton: true,
    );

    if (language != null && language == dialogResult.language) {
      return;
    }

    if (dialogResult.language == VIETNAMESE_LANG) {
      Get.updateLocale(const Locale('vi', 'VN'));
    }

    if (dialogResult.language == ENGLISH_LANG) {
      Get.updateLocale(const Locale('en', 'US'));
    }

    await prefs.setString(StorageConstants.language, dialogResult.language);
  }

  Future<void> receiveFromAnotherApp() async {
    try {
      final initialInfo = await getInitialLink();
      if (initialInfo != null) {
        // TODO: receive infomation
        showError(content: initialInfo);
      }
    } on PlatformException {
      print('error');
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

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
