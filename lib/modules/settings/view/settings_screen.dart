import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/settings/controller/settings_controller.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/switch_widget/switch_widget.dart';

class SettingsScreen extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Obx(() {
              return _buildBiometricSettingWidget(context);
            }),
            _buildLogoutSettingWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBiometricSettingWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: Card(
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 1, bottom: 1),
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor: context.theme.primaryColor,
                  child: const Icon(
                    Icons.touch_app,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Đăng nhập vân tay',
                style: Theme.of(context).textTheme.headline1,
              ),
              const Spacer(),
              // Icon(Icons.navigate_next, color: context.theme.primaryColor),
              SwitchWidget(
                value: controller.isUseBiometric.value,
                onChanged: (value) {
                  controller.changeSettingBiometric();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutSettingWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),
      child: GestureDetector(
        onTap: () async {
          await controller.confirmLogout();
        },
        child: Card(
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 10, right: 8, bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundColor: Get.theme.primaryColor,
                    radius: 66,
                    child: const Icon(
                      Icons.power_settings_new,
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Đăng xuất',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                Icon(Icons.navigate_next, color: Get.theme.primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
