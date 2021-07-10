import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/moto_rescue_buy/controller/moto_rescue_buy_controller.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/models/moto_resue/moto_rescue_model.dart';
import 'package:go_trust/shared/theme/theme_color.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';
import 'package:go_trust/shared/widgets/step_widget/step_widget.dart';
import 'package:go_trust/shared/widgets/tabs/custom_tab.dart';
import 'package:intl/intl.dart';

part 'moto_rescue_buy.action.dart';
part 'moto_rescue_buy.children.dart';

class MotoRescueBuyScreen extends GetView<MotoRescueBuyController> {
  BuyMotoRescueViewModel viewModel = BuyMotoRescueViewModel.fromMock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Cứu hộ xe máy 24/7',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const StepWidget(currentStepIndex: 0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 16,
                  ),
                  child: CustomTab(
                    items: const [
                      'Xe máy dưới 175cc',
                      'Xe máy trên 175cc',
                    ],
                    activeItemDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xff83DCA7).withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: ThemeDecoration.textFieldWithShadow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'PHÍ THÀNH VIÊN: ',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            TextSpan(
                                text: viewModel.price.formatVnd,
                                style: Theme.of(context)
                                    .accentTextTheme
                                    .headline3),
                            TextSpan(
                              text: ' / năm',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List<Widget>.generate(
                              viewModel.items.length,
                                  (index) => rescueDetailItem(
                                  icon: FCoreImage(viewModel.items[index].icon),
                                  title: viewModel.items[index].title,
                                  value: viewModel.items[index].value,
                                  type: viewModel.items[index].type),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AppGradientButton(
                onPressed: onBuyNowButtonPressed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Mua ngay',
                    style: Theme.of(context).accentTextTheme.headline2,
                  ),
                ),
              ),
              const SizedBox(height: 16)
            ],
          )),
    );
  }
}

extension _Price on int {
  String get formatVnd {
    final oCcy = NumberFormat('#,###', 'en_US');
    return '${oCcy.format(this)} VNĐ';
  }
}