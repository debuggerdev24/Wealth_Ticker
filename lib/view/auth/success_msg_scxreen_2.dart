import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/view/auth/success_msg_screen_1.dart';

import '../../core/routes/routes.dart';
import '../../core/widgets/my_button.dart';

class SuccessMsgScreen2 extends StatelessWidget {
  const SuccessMsgScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 72.h, 15.w, 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SuccessMsgBox(
              offer: '“You get 7 extra days free!"',
              img: AppAssets.successMsg2, //"assets/images/auth_screen/success_msg_2.svg"
            ),
            // SVGImages(iconPath: "assets/images/auth_screen/error_msg.svg"),
            MySubmitButtonFilled(
              title: "Done",
              onPressed: () {
                context.pushNamed(AppRoutes.onBoardingScreen.name);
              },
            )
          ],
        ),
      ),
    );
  }
}
