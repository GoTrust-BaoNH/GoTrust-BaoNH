import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_trust/modules/home/controller/home_controller.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/carousel/carousel_widget.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/tabs/custom_tab.dart';

part 'home_screen.children.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          emergencyWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      'insurance_utilities'.tr,
                      style: Theme.of(context).accentTextTheme.bodyText2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: CustomTab(
                      items: [
                        'all'.tr,
                        'insurance'.tr,
                        'utilities'.tr,
                        'bought'.tr,
                      ],
                      activeItemDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xff83DCA7).withOpacity(0.2),
                      ),
                    ),
                  ),
                  Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List<Widget>.generate(controller.itemData.length, (index) {
                        final dynamic item = controller.itemData[index];
                        return homeItem(
                          icon: FCoreImage(
                            item['icon'],
                            fit: BoxFit.fitHeight,
                          ),
                          title: item['title'],
                          isOwner: true,
                        );
                      }),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 50),
                    child: _buildPromotions(controller.listPromotion),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      'insurance_utilities'.tr,
                      style: Theme.of(context).accentTextTheme.bodyText2,
                    ),
                  ),
                  Column(
                    children: List<Widget>.generate(
                      controller.bestSellerItem.length,
                      (index) => bestSellerItemWidget(
                        icon: FCoreImage(controller.bestSellerItem[index]['icon']),
                        imageUrl: controller.bestSellerItem[index]['image'],
                        title: controller.bestSellerItem[index]['title'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      'our_partner'.tr,
                      style: Theme.of(context).accentTextTheme.bodyText2,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 40,
                      ),
                      child: Row(
                        children: List<Widget>.generate(
                          controller.listPartner.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: FCoreImage(controller.listPartner[index]),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
