import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_trust/shared/constants/common.dart';
import 'package:go_trust/shared/utils/size_config.dart';
import 'package:go_trust/shared/styles/text_style.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ExactAssetImage(
            '${IMAGE_ASSET}bg_welcome.png',
          ),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset('${IMAGE_ASSET}ic_logo_app.png', width: 100, height: 100),
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
                      style: TextAppStyle().bodyContentTextStyle(),
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
