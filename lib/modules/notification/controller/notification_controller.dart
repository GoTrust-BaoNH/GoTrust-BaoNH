import 'package:get/get.dart';
import 'package:go_trust/data/base/base_controller.dart';
import 'package:go_trust/data/common/define_field.dart';
import 'package:go_trust/shared/dialog_manager/services/dialog_service.dart';
import 'package:go_trust/shared/models/notification/notifications_model.dart';
import 'package:go_trust/shared/models/product/product_enum.dart';
import 'package:go_trust/shared/network/constants/constants.dart';
import '../../../data/repository/api_repository.dart';
import '../../../shared/dialog_manager/data_models/request/common_dialog_request.dart';

class NotificationController extends BaseController {
  NotificationController({required this.apiRepository});

  final ApiRepository apiRepository;

  List<NotificationModel> list = [
    NotificationModel(
        notificationType: ProductEnum.MotoInsurance,
        status: 'Đã duyệt thành công',
        description: 'Gói bảo hiểm',
        createTime: '1 phút trước'),
    NotificationModel(
        notificationType: ProductEnum.MotoInsurance,
        status: 'Còn 04 ngày nữa hết hạn!',
        description: 'Gói bảo hiểm',
        isExpired: true,
        createTime: '2 phút trước'),
    NotificationModel(
        notificationType: ProductEnum.MotoInsurance,
        status: 'Đã duyệt thành công',
        description: 'Gói bảo hiểm',
        createTime: '3 phút trước'),
    NotificationModel(
        notificationType: ProductEnum.MobileData,
        status: 'Đã duyệt thành công',
        description: 'Mobile Data',
        createTime: '30 phút trước'),
    NotificationModel(
        notificationType: ProductEnum.MobileData,
        status: 'Đã duyệt thành công',
        description: 'Mobile Data',
        createTime: '30 phút trước'),
    NotificationModel(
        notificationType: ProductEnum.MedicalOnline,
        status: 'Còn 04 ngày nữa hết hạn!',
        description: 'Gói tiện ích',
        createTime: '3 ngày trước'),
    NotificationModel(
        notificationType: ProductEnum.MedicalOnline,
        status: 'Còn 06 ngày nữa hết hạn!',
        description: 'Gói tiện ích',
        isExpired: true,
        createTime: '3 ngày trước'),
    NotificationModel(
        notificationType: ProductEnum.MedicalOnline,
        status: 'Còn 04 ngày nữa hết hạn!',
        description: 'Gói tiện ích',
        isExpired: true,
        createTime: '3 ngày trước'),
    NotificationModel(
        notificationType: ProductEnum.OnlineShopping,
        status: 'Đã duyệt thành công',
        description: 'Gói bảo hiểm',
        createTime: '3 tháng trước'),
    NotificationModel(
        notificationType: ProductEnum.OnlineShopping,
        status: 'Đã duyệt thành công',
        description: 'Gói bảo hiểm',
        createTime: '3 tháng trước'),
  ];

  @override
  Future<void> onInit() async {
    await super.onInit();
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
