import 'package:flutter/material.dart';
import 'package:go_trust/shared/constants/colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.onPressed,
    required this.child,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.disabledButtonColorLight,
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
