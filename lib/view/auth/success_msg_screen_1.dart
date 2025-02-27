import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/global.dart';
import '../../core/widgets/my_button.dart';
import '../../core/widgets/svg_images.dart';

class SuccessMsgScreen1 extends StatelessWidget {
  const SuccessMsgScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 72.h, 15.w, 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SuccessMsgBox(
              text: '“You get a 10% discount on your subscription."',
              img: AppAssets.successMsg1,
            ),
            // SVGImages(iconPath: "assets/images/auth_screen/error_msg.svg"),
            MySubmitButtonFilled(
              title: "Done",
              onPressed: () {
                context.pushNamed(AppRoutes.successMsgScreen2.name);
              },
            )
          ],
        ),
      ),
    );
  }
}

class SuccessMsgBox extends StatelessWidget {
  final String text, img;

  const SuccessMsgBox({super.key, required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 245.h,
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
        color: Color(0xFFededed),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "✅ Referral Code Applied!",
            style: textStyleW600.copyWith(color: Colors.grey.shade700),
          ),
          SVGImages(
            path: img,
            height: 80.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: textStyleW700.copyWith(fontSize: 20.sp, color: AppColors.darkGreenColor),
          ),
        ],
      ),
    );
  }
}
