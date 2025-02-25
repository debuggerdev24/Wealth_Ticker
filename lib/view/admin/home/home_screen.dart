import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';

import '../../../core/text_styls.dart';
import '../../../core/utils/global.dart';

class HomeScreenAdmin extends StatelessWidget {
  const HomeScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: greenColor,
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark background
      ),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 30.h, 12.w, 5.h),
        child: Column(
          children: [
            24.h.verticalSpace,
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Text("Hello Daniel...",
                  style: textStyleW700.copyWith(
                      color: greenColor, fontSize: 20.sp)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.profileScreen.path);
                    },
                    child: CircleAvatar(
                      radius: 23.r,
                    ),
                  ),
                  10.w.horizontalSpace,
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Icon(CupertinoIcons.bell),
                  )
                ],
              ),
            ),
            22.h.verticalSpace,
            Container(
              width: 1.sw,
              height: 100.h,
              padding: EdgeInsets.only(
                top: 12.h,
                left: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                color: Color(0xffcbd6d3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Paid Posts",
                    style: textStyleW600.copyWith(fontSize: 14.sp),
                  ),
                  5.h.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "152",
                        style: textStyleW700.copyWith(
                          fontSize: 38.sp,
                        ),
                      ),
                      30.w.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Paid posts this week",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 1.sw,
              height: 100.h,
              padding: EdgeInsets.only(
                top: 12.h,
                left: 20.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
                color: Color(0xff67827b),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Lucky Draw Entries",
                    style: textStyleW600.copyWith(
                        fontSize: 14.sp, color: Colors.white),
                  ),
                  5.h.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "320",
                        style: textStyleW700.copyWith(
                          color: Colors.white,
                          fontSize: 38.sp,
                        ),
                      ),
                      30.w.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "Paid posts this week",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            26.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payouts Processed",
                  style: textStyleW600.copyWith(fontSize: 18.sp),
                ),
                Text(
                  "\$4,500",
                  style: textStyleW700.copyWith(
                      fontSize: 18.sp, color: Color(0xff329687)),
                ),
              ],
            ),
            11.h.verticalSpace,
            LinearProgressIndicator(
              backgroundColor: Color(0xffe6e6ed),
              value: 0.7,
              borderRadius: BorderRadius.circular(50.r),
              // valueColor: ,
              minHeight: 24.h,
              color: Color(0xff96bf7a),
            ),
            2.h.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: Text("“distributed”"),
            ),
            22.h.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Lucky Draw",
                style: textStyleW600.copyWith(
                  fontSize: 18.sp,
                ),
              ),
            ),
            10.h.verticalSpace,
            detailsRow("Current Draw Prize Pool", "\$1,500"),
            detailsRow("Next Draw Countdown", "3 days remaining"),
            26.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Scheduled Market Update",
                  style: textStyleW600.copyWith(
                    color: greenColor,
                    fontSize: 18.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "See All",
                    style: textStyleW700.copyWith(
                      color: Color(0xff329687),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Row detailsRow(String title, String answer) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          title,
        ),
      ),
      Text(
        "  :  ",
        style: textStyleW600,
      ),
      Expanded(
        child: Text(
          answer,
          style: textStyleW600,
        ),
      ),
    ],
  );
}

List a = [
  {
    "title": "Total Users :",
    "value": "5000",
  },
  {
    "title": "Active Users :",
    "value": "3,200",
  },
  {
    "title": "New Request :",
    "value": "15",
  },
  {
    "title": "Subscribers:",
    "value": "2,500",
  },
];

class MyBox extends StatelessWidget {
  final String title, value;

  const MyBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Color(0xffDDE7E4),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp),
          ),
          8.h.verticalSpace,
          Text(
            value,
            style: textStyleW700.copyWith(fontSize: 27.sp),
          ),
        ],
      ),
    );
  }
}
