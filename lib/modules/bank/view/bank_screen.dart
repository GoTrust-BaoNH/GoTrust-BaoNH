import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/bank/controller/bank_controller.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/bank_item_widget/bank_item.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/search_bar_widget/search_bar_widget.dart';

class BankScreen extends GetView<BankController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: <Widget>[
            SearchBarWidget(
              controller: controller.searchController,
            ),
            const SizedBox(height: 16),
            Obx(
              () => Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: ListView.separated(
                    itemBuilder: (context, index) => BankItem(
                      icon: FCoreImage(controller.listBankDisplay[index].imageUrl!),
                      title: controller.listBankDisplay[index].title!,
                      onTap: controller.onBankItemPressed,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                    ),
                    itemCount: controller.listBankDisplay.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
