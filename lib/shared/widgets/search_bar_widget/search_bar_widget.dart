import 'package:flutter/material.dart';
import 'package:go_trust/shared/theme/theme_decoration.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: ThemeDecoration.textFieldWithShadow,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline1,
              decoration: ThemeDecoration.inputNoneBorder,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.search,
              color: const Color(0xff333333).withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
