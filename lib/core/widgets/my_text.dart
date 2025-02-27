import 'package:flutter/cupertino.dart';

class MyText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign? textAlign;

  const MyText(
      {super.key, required this.data, required this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: style,
    );
  }
}
