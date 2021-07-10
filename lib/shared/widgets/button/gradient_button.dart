import 'package:flutter/material.dart';
import 'package:go_trust/shared/theme/theme_color.dart';

class AppGradientButton extends StatelessWidget {
  const AppGradientButton({
    required this.onPressed,
    required this.child,
    Key? key,
    this.borderRadius,
  }) : super(key: key);

  final Function()? onPressed;
  final Widget child;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        color: onPressed == null ? AppThemeColor.primary.withOpacity(0.4) : null,
        gradient: onPressed != null
            ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppThemeColor.color45C152,
                  AppThemeColor.color0ADC90,
                ],
              )
            : null,
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
