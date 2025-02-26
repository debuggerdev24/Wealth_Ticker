import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';

import '../../core/routes/routes.dart';
import '../../core/widgets/my_button.dart';
import '../../core/widgets/svg_images.dart';

class ErrorMsgScreen extends StatelessWidget {
  const ErrorMsgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 72.h, 15.w, 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 245.h,
              width: width,
              padding: EdgeInsets.fromLTRB(20.h, 25.h, 20.h, 25.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(0, 5),
                    blurRadius: 12
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey.shade400,
                ),
                color: Color(0xffe5e5e5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SVGImages(
                    path: AppAssets.invalidRef,
                    height: 108.h,
                  ),
                  Text(
                    '"Invalid referral code. Please check and try again."',
                    textAlign: TextAlign.center,
                    style:
                        textStyleW700.copyWith(fontSize: 17.sp),
                  )
                ],
              ),
            ),
            // SVGImages(iconPath: "assets/images/auth_screen/error_msg.svg"),
            MySubmitButtonFilled(
              title: "Cancel",
              onPressed: () {
                context.pushNamed(AppRoutes.successMsgScreen1.name);
              },
            )
          ],
        ),
      ),
    );
  }
}
