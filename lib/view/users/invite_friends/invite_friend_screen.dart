import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../../core/utils/global.dart';
import '../../../core/widgets/my_app_layout.dart';

class InviteProfileScreen extends StatelessWidget {
  const InviteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Invite Friends",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your refferral code",
              style: textStyleW700.copyWith(fontSize: 18.sp),
            ),
            SizedBox(height: 16.h),
            Text(
                "Invite your friends to join the Wealth Tickers using your personalized referral Code."),
            SizedBox(height: 16.h),
            Text(
              "Click here to see invited friends list",
              style: textStyleW700.copyWith(
                  color: greenColor,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2),
            ),
            SizedBox(height: 25.h),
            TextField(
              cursorColor: greenColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                // contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                hintText: " Enter code",
                hintStyle: TextStyle(color: Colors.black87),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none, // Removes the border
                ),
              ),
            ),
            SizedBox(
              height: 72.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      "Share",
                      style: textStyleW700.copyWith(
                          fontSize: 16.sp,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Container(
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffcbd6d3),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      "Copy Code",
                      style: textStyleW700.copyWith(
                        fontSize: 16.sp,
                        color: greenColor,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
