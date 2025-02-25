import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../utils/global.dart';

class AuthTitle extends StatelessWidget {
  final String title;

  const AuthTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyleW700.copyWith(
          fontSize: 36.sp,
          color: greenColor,
          ),
    );
  }
}

class AuthSlogan extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const AuthSlogan({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14.sp
        ),

        // TextStyle(
        //     fontSize: 14.sp,
        //     fontWeight: FontWeight.w400,
        //     color: Colors.grey.shade600),
      ),
    );
  }
}
