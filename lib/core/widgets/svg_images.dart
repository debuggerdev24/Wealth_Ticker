import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGImages extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final Color? color;

  const SVGImages({super.key, required this.path, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
