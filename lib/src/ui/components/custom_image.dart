// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final CustomImages image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  static const String _imagesAssetsPath = 'assets/images/';

  const CustomImage({
    required this.image,
    this.height,
    this.width,
    this.fit,
    this.alignment = Alignment.center,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      '$_imagesAssetsPath${describeEnum(image)}.png',
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
    );
  }

  AssetImage asset(BuildContext context) {
    return AssetImage(
      '$_imagesAssetsPath${describeEnum(image)}.png',
    );
  }
}

enum CustomImages {
  avengers,
  mobile_error_image,
}
