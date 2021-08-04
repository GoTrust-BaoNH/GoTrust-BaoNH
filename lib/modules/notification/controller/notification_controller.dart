import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import 'package:gotrust_repository_data/gotrust_repository_data.dart';
import 'package:gotrust_repository_data/shared/models/notification/notification_item_model.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class NotificationController extends BaseController {
  NotificationController({required this.apiRepository});

  final Infrastructure apiRepository;

  var list = <NotificationItemModel>[].obs;

  @override
  Future<void> onInit() async {
    await super.onInit();
    await getListNotification();
  }

  Future<void> getListNotification() async {
    await EasyLoading.show();
    await apiRepository.getListNotification(userId: 1).then((result) async {
      await EasyLoading.dismiss();
      if (result.listNotification!.isNotEmpty) {
        list.value = result.listNotification!;
      } else {
        final dialogRequest = CommonDialogRequest(
          title: 'error'.tr,
          description: 'unknown_error'.tr,
          typeDialog: DIALOG_ONE_BUTTON,
          defineEvent: 'unknown_error',
        );
        await _doShowDialog(dialogRequest);
      }
    }, onError: (e) async {
      await EasyLoading.dismiss();
      await _doShowDialog(handleErrorResponse(e));
    });
  }

  Future<void> onTapItemNotification(NotificationItemModel item) async {
    await EasyLoading.show();
    final itemDetailsModel = await apiRepository.getItemNotification(id: item.id ?? '');
    await EasyLoading.dismiss();
    // TODO: show info
    print(itemDetailsModel.toString());
  }

  @override
  Future<void> onReady() async {
    await super.onReady();
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
