import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';

import '../../../core/routes/routes.dart';
import '../../../core/widgets/svg_images.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Support",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 5.h),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            //todo img comes here
            SVGImages(
                iconPath: AppAssets.headPhone,//"assets/images/headPhone.svg",
                height: 90.h,
                width: 90.w),
            SizedBox(height: 6.h),
            Text(
              "Hello, How can we\nHelp you?",
              textAlign: TextAlign.center,
              style: textStyleW700.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 35.h),
            MyTile(
              title: " Send us an Email",
              icon: CupertinoIcons.mail,
              onTap: () {
                context.pushNamed(AppRoutes.sendUsEmailScreen.name);
              },
            ),
            SizedBox(height: 20.h),
            MyTile(
              title: " FAQs",
              icon: Icons.report_gmailerrorred_sharp,
              onTap: () {
                context.pushNamed(AppRoutes.faqScreen.name);
              },
            ),
          ],
        ),
      ),
    );
    // body: Padding(
    //   padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 5.h),
    //   child: Column(
    //     children: [
    //       SizedBox(height: 70.h),
    //       //todo img comes here
    //       SizedBox(height: 6.h),
    //       Text(
    //         "Hello, How can we\nHelp you?",
    //         textAlign: TextAlign.center,
    //         style: GoogleFonts.openSans(
    //             fontSize: 22.sp, fontWeight: FontWeight.w700),
    //       ),
    //       SizedBox(height: 35.h),
    //       MyTile(
    //         title: " Send us an Email",
    //         icon: CupertinoIcons.mail,
    //         onTap: () {
    //           context.pushNamed(AppRoutes.sendUsEmailScreen.name);
    //         },
    //       ),
    //       SizedBox(height: 20.h),
    //       MyTile(
    //         title: " FAQs",
    //         icon: Icons.report_gmailerrorred_sharp,
    //         onTap: () {
    //           context.pushNamed(AppRoutes.faqScreen.name);
    //         },
    //       ),
    //     ],
    //   ),
    // ),
  }
}

class MyTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MyTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 0.w),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade400, offset: Offset(0, 5), blurRadius: 4),
      ], color: Color(0xffededed), borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(fontSize: 14.sp),
        ),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
    );
  }
}
