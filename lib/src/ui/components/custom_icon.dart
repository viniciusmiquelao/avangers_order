// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  static const String _assetsCustomIconsPath = 'assets/icons/';
  final CustomIcons asset;
  final double width;
  final double height;
  final bool branded;
  final Color? color;
  final Function()? onTap;

  const CustomIcon(
      {required this.asset,
      Key? key,
      this.width = 25,
      this.height = 25,
      this.branded = false,
      this.color,
      this.onTap})
      : super(key: key);

  const CustomIcon.internal(
      {required this.asset,
      Key? key,
      this.color,
      this.width = 48,
      this.height = 48,
      this.branded = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        '$_assetsCustomIconsPath${describeEnum(asset)}.svg',
        colorFilter: color != null
            ? ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn)
            : null,
        width: width,
        height: height,
      ),
    );
  }
}

enum CustomIcons {
  marvel_black,
  marvel_white,
  menu,
}
