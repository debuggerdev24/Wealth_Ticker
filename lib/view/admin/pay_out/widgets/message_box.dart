import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import '../../../../core/text_styls.dart';

class OutPutMessageBox extends StatelessWidget {
  final String filledButtonTitle, outLinedButtonTitle;
  final VoidCallback outlinedButtonOnTap, filledButtonOnTap;
  final Widget child;

  const OutPutMessageBox(
      {super.key,
      required this.child,
      required this.filledButtonTitle,
      required this.outLinedButtonTitle,
      required this.outlinedButtonOnTap,
      required this.filledButtonOnTap});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Column(
        children: [
          Container(
            width: width,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 22.h),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(0, 5),
                      blurRadius: 12),
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                color: AppColors.lightCreamColor//Color(0x80d9d9d9)
            ),
            child: child,
          ),
          Spacer(),
          MySubmitButtonOutlined(
            title: outLinedButtonTitle,
            onPressed: outlinedButtonOnTap,
          ),
          14.h.verticalSpace,
          MySubmitButtonFilled(
            title: filledButtonTitle,
            onPressed: filledButtonOnTap,
          ),
          20.h.verticalSpace
        ],
      ),
    );
  }
}
