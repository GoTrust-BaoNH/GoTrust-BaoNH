import 'package:flutter/material.dart';

class AppColor {
  AppColor();

  /// Light Color
  static Color defaultHeaderOSColorLight = const Color(0xFF0ADC90); // light green
  static Color primaryColorLight = const Color(0xFF45C152); // green
  static Color accentColorLight = const Color(0xFFF47458); // orange
  static Color dividerColorLight = const Color(0xFFF0F0F0); // grey
  static Color primaryTextColorLight = const Color(0xFF333333); // black
  static Color secondTextColorLight = const Color(0xFFFFFFFF); // white
  static Color primaryHintColorLight = const Color(0xFF888888); // gray
  static Color primaryBorderColorLight = const Color(0xFFF0F0F0); // gray
  static Color primarySelectedColorLight = const Color(0xFFADADAD); // gray
  static Color primaryBackgroundColorLight = const Color(0xFFF2F4F8); // gray
  static Color disabledColorLight = const Color(0xFFADADAD); // gray
  static Color errorColorLight = const Color(0xFFEE0707); // red
  static Color cursorColorLight = const Color(0xFF000000); // black
  static Color secondBackgroundColorLight = const Color(0xFFFFFFFF); // white
  static Color shadowColorLight = const Color(0x42000000); // black26
  static Color disabledButtonColorLight = const Color(0xFFE1EBE4); // light green

  // /// Dark Color
  // static Color defaultHeaderOSColorDark = const Color(0xFF0ADC90); // light green
  // static Color primaryColorDark = const Color(0xFF45C152); // green
  // static Color accentColorDark = const Color(0xFFFFD600); // orange
  // static Color dividerColorDark = const Color(0xFFF1F1F1); // grey
  // static Color primaryTextColorDark = const Color(0xFFFFFFFF); // white
  // static Color secondTextColorDark = const Color(0xFF000000); // black
  // static Color primaryHintColorDark = const Color(0xFFADADAD); // gray
  // static Color primaryBorderColorDark = const Color(0xFFADADAD); // gray
  // static Color primarySelectedColorDark = const Color(0xFFADADAD); // gray
  // static Color primaryBackgroundColorDark = const Color(0xFF000000); // black
  // static Color disabledColorDark = const Color(0xFFADADAD); // gray
  // static Color errorColorDark = const Color(0xFFEE0707); // red
  // static Color cursorColorDark = const Color(0xFFFFFFFF); // white
  // static Color secondBackgroundColorDark = const Color(0xFFFFFFFF); // white
  // static Color shadowColorDark = const Color(0x42FFFFFF); // white26
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
