import 'package:flutter/material.dart';
import 'package:go_trust/shared/models/payment_model/payment_method_model.dart';
import 'package:go_trust/shared/theme/theme_color.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';

class PaymentMethodItem extends StatefulWidget {
  const PaymentMethodItem({
    required this.viewModel,
    required this.isSelected,
    required this.onChange,
    Key? key,
  }) : super(key: key);
  final PaymentMethodModel viewModel;
  final bool isSelected;
  final Function() onChange;

  @override
  _PaymentMethodItemState createState() => _PaymentMethodItemState();
}

class _PaymentMethodItemState extends State<PaymentMethodItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChange,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.isSelected ? const Color(0xffF1FFF4) : null,
          border: Border.all(
              color: widget.isSelected ? AppThemeColor.primary : const Color(0xffE0E0E0), width: widget.isSelected ? 2 : 1),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 24),
              child: widget.isSelected
                  ? const Icon(
                      Icons.radio_button_checked,
                      color: AppThemeColor.accent,
                    )
                  : const Icon(
                      Icons.radio_button_off,
                      color: Color(0xffA3AAB3),
                    ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FCoreImage(widget.viewModel.image),
                Text(
                  widget.viewModel.title,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
