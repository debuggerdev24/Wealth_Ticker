import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.bounceOut,
      margin: EdgeInsets.only(top: 5.sp),
      height: 48.h,
      decoration: BoxDecoration(
          color: AppColors.errorBackgroundColor,
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(color: AppColors.errorBorderColor)),
      child: Row(
        children: [
          10.sp.horizontalSpace,
          SVGImages(
            path: AppAssets.errorIcon,
          ),
          15.sp.horizontalSpace,
          Text(
            errorMessage,
            style: TextStyle().copyWith(color: AppColors.errorTextColor),
          )
        ],
      ),
    );
  }
}