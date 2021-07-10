import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/resource/assets_constant/images_constants.dart';
import 'package:go_trust/shared/constants/colors.dart';
import 'package:go_trust/shared/styles/text_style.dart';
import 'package:go_trust/shared/widgets/image_widget/fcore_image.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColor.primaryBackgroundColorLight,
      child: Stack(
        children: [
          Center(
            child: FCoreImage(
              ImageConstants.appIcon,
              width: width * 0.36,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Text.rich(
                TextSpan(
                  text: '${'version'.tr}: ',
                  style: TextAppStyle().versionTextStyle(),
                  children: [
                    TextSpan(
                      text: '1.0.0',
                      style: TextAppStyle().versionContentTextStyle(),
                    ),
                    // can add more TextSpans here...
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
