import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:go_trust/modules/auth/controller/auth_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';

class QRCodeScreen extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Color(0xFFE1EBE4),
      ),
      child: MaterialButton(
        onPressed: (){
          // print()
        },
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints(maxHeight: 48),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                   Icon(
                    Icons.qr_code_scanner,
                    size: 20,
                    color: AppColor.primaryColorLight,
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 0.5,
                    color: AppColor.primaryColorLight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
