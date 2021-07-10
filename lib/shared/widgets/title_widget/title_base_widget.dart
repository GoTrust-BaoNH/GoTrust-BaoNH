import 'package:flutter/material.dart';

Widget titleBase(
  BuildContext context, {
  required String title,
  Color? color,
  EdgeInsets? padding,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.only(bottom: 8, top: 5),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color: color ?? Theme.of(context).accentColor,
      ),
    ),
  );
}
