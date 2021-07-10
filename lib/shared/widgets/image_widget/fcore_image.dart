import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'skeleton_widget.dart';

class FCoreImage extends StatelessWidget {
  const FCoreImage(
    this.source, {
    Key? key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.usePlaceHolder = true,
    this.color,
  }) : super(key: key);

  final String source;
  final BoxFit fit;
  final double? width;
  final double? height;
  final bool usePlaceHolder;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (source.isEmpty) {
      return const Placeholder();
    }
    if (source.contains('.svg')) {
      return SvgPicture.asset(
        source,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
    if (source.contains('http')) {
      // return Image.network(
      return ExtendedImage.network(
        source,
        cache: true,
        fit: fit,
        loadStateChanged: (state) {
          Widget widget;
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              widget = usePlaceHolder ? const SizedBox() : Skeleton();
              break;
            case LoadState.completed:
              widget = ExtendedRawImage(
                image: state.extendedImageInfo?.image,
                width: width,
                height: height,
                fit: fit,
              );
              break;
            case LoadState.failed:
              widget = Container(
                width: width,
                height: height,
                color: Colors.grey,
              );
              break;
          }
          return widget;
        },
      );
    }
    return Image.asset(
      source,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
