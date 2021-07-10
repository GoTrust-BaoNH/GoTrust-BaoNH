import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/modules/payment_info/controller/payment_info_controller.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';
import 'package:go_trust/shared/widgets/appbar/app_bar_widget.dart';
import 'package:go_trust/shared/widgets/button/gradient_button.dart';
import 'package:go_trust/shared/widgets/text_input/input_widget.dart';

class PaymentMethodScreen extends GetView<PaymentInfoController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: appbar(context),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  'Thông tin thanh toán',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const InputWidget(
                        hint: 'Nhập tên ghi trên thẻ',
                        lable: 'Chủ thẻ',
                      ),
                      const SizedBox(height: 16),
                      const InputWidget(
                        hint: 'Nhập số thẻ',
                        lable: 'Số thẻ',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                           Expanded(
                            child: InputWidget(
                              hint: 'Nhập số CVV',
                              lable: 'CVV',
                            ),
                          ),
                           SizedBox(width: 16),
                           Expanded(
                            child: InputWidget(
                              hint: 'Tháng / năm',
                              lable: 'Ngày hết hạn',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 12),
                        child: Text(
                          'Nội dung thanh toán',
                          style: Theme.of(context).accentTextTheme.bodyText2,
                        ),
                      ),
                      Container(
                        width: Get.width,
                        decoration: ThemeDecoration.textFieldWithShadow,
                        padding: const EdgeInsets.only(
                          top: 12,
                          right: 12,
                          left: 12,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(controller.paymentDescription),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Số tiền thanh toán',
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                  TextSpan(
                                    text: controller.formatVnd(controller.price.toString()),
                                    style: Theme.of(context).accentTextTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              AppGradientButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Xác nhận',
                    style: Theme.of(context).accentTextTheme.headline2,
                  ),
                ),
              ),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
