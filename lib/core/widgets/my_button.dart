import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../utils/global.dart';

class MySubmitButtonFilled extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width, fontSize;

  const MySubmitButtonFilled(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52.h,
        width: width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 0.h),
        //21
        decoration: BoxDecoration(
            color: greenColor, borderRadius: BorderRadius.circular(10.r)),
        child: Text(
          title,
          style: textStyleW700.copyWith(
            //GoogleFonts.openSans
            fontSize: fontSize ?? 20.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MySubmitButtonOutlined extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height,width, fontSize, marginTop, marginBottom, padding;

  const MySubmitButtonOutlined(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.fontSize,
      this.marginTop,
      this.marginBottom,
      this.padding, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height ?? 52.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: marginTop ?? 0.h,
          bottom: marginBottom ?? 0.h,
        ),
        //21
        decoration: BoxDecoration(
            border: Border.all(
              color: greenColor,
            ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          title,
          style: textStyleW700.copyWith(
              fontSize: fontSize ?? 20.sp, color: greenColor),
        ),
      ),
    );
  }
}
