import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final double? paddingLeft;

  const CustomErrorWidget(
      {super.key, required this.errorMessage, this.paddingLeft});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.bounceOut,
      margin: EdgeInsets.only(top: 5.sp),
      padding:
          EdgeInsets.only(top: 14.h, bottom: 14.h, left: paddingLeft ?? 15.5.w),
      decoration: BoxDecoration(
          color: AppColors.errorBackgroundColor,
          borderRadius: BorderRadius.circular(7.r),
          border: Border.all(color: AppColors.errorBorderColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SVGImages(
            path: AppAssets.errorIcon,
          ),
          15.sp.horizontalSpace,
          Expanded(
            child: Text(
              errorMessage,
              style: TextStyle().copyWith(color: AppColors.errorTextColor),
            ),
          )
        ],
      ),
    );
  }
}
