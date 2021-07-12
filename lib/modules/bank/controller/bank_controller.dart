import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/routes/app_pages.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';

import '../../../data/repository/api_repository.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class BankController extends BaseController {
  BankController({required this.apiRepository});

  final ApiRepository apiRepository;

  late TextEditingController searchController;
  late List<dynamic> listBank;

  final listBankMock = [
    {'icon': ImageConstants.tpBank, 'title': 'TP bank'},
    {'icon': ImageConstants.tpBank, 'title': 'VP bank'},
    {'icon': ImageConstants.tpBank, 'title': 'Agribank'},
    {'icon': ImageConstants.tpBank, 'title': 'Techcom bank'},
    {'icon': ImageConstants.tpBank, 'title': 'BIDV'},
    {'icon': ImageConstants.tpBank, 'title': 'Vietcombank'},
    {'icon': ImageConstants.tpBank, 'title': 'DongA bank'},
    {'icon': ImageConstants.tpBank, 'title': 'Viettin bank'},
  ];

  @override
  Future<void> onInit() async {
    searchController = TextEditingController();
    listBank = listBankMock;
    await super.onInit();

    searchController.addListener(() {
      listBank = listBankMock.where((element) {
        final _bankTitle = element['title']!.toString().toLowerCase();
        return _bankTitle.contains(searchController.text.toLowerCase());
      }).toList();
    });
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
  }

  void onBankItemPressed() {
    Get.toNamed(Routes.PAYMENT_INFO_SCREEN);
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
      case Unknown_Error:
        break;
      default:
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
