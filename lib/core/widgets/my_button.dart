import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../theme/app_colors.dart';
import '../utils/global.dart';

class MySubmitButtonFilled extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double? width, fontSize, height;

  const MySubmitButtonFilled(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.fontSize,
      this.height,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 52.h,
        width: width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 0.h),
        //21
        decoration: BoxDecoration(
            color: AppColors.darkGreenColor,
            borderRadius: BorderRadius.circular(10.r)),
        child: Text(
          title,
          style: textStyle ??
              textStyleW700.copyWith(
                //GoogleFonts.openSans
                fontSize: fontSize ?? 19.sp,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

class MySubmitButtonOutlined extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final double? height,
      width,
      borderRadius,
      fontSize,
      marginTop,
      marginBottom,
      padding;

  const MySubmitButtonOutlined(
      {super.key,
      required this.title,
      required this.onPressed,
      this.width,
      this.fontSize,
      this.marginTop,
      this.marginBottom,
      this.padding,
      this.height,
      this.textStyle,
      this.borderRadius});

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
            color: AppColors.darkGreenColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        ),
        child: Text(
          title,
          style: textStyle ??
              textStyleW700.copyWith(
                //GoogleFonts.openSans
                fontSize: fontSize ?? 19.sp,
                color: AppColors.darkGreenColor,
              ),
        ),
      ),
    );
  }
}
