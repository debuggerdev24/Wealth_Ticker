import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGImages extends StatelessWidget {
  final String iconPath;
  final double? height;
  final double? width;

  const SVGImages({super.key, required this.iconPath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      height: height,
      width: width,
    );
  }
}
