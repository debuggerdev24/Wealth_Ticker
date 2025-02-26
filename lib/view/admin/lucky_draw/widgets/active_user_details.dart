import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/global.dart';

class ActiveUserDetails extends StatelessWidget {
  final String name, email, mobile, subscriptionPlan, groupMembership,buttonTitle;

  const ActiveUserDetails(
      {super.key,
      required this.name,
      required this.email,
      required this.mobile,
      required this.subscriptionPlan,
      required this.groupMembership, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 16.h, left: 14.h, right: 10.w, bottom: 16.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.darkGreenColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              buildUserInfoRow(CupertinoIcons.person, "Name", name),
              buildUserInfoRow(
                  CupertinoIcons.mail, "Email", email),
              buildUserInfoRow(
                  Icons.phone_android, "Mobile Number", mobile),
              buildUserInfoRow(
                  Icons.card_membership_outlined, "Subscription Plan", subscriptionPlan),
              buildUserInfoRow(Icons.groups, "Group Memberships", groupMembership),
            ],
          ),
        ),
        17.h.verticalSpace,
        MySubmitButtonFilled(
          width: 0.5.sw,
          title: buttonTitle,
          onPressed: () {},
        ),
      ],
    );
  }
}
Widget buildUserInfoRow(IconData icon, String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.darkGreenColor, size: 22.sp), // Icon
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 14.sp, height: 1.5),
          ),
        ),
        Text(" :",
            style: textStyleW700.copyWith(fontSize: 15.sp,),),
        8.w.horizontalSpace,
        Expanded(
          child: Text(
            value,
            style: textStyleW500.copyWith(
                fontSize: 13.sp, height: 1.5),
          ),
        ),
        // Spacer(),
      ],
    ),
  );
}
