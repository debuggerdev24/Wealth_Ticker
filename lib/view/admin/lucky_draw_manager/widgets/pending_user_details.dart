import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import '../../../../core/utils/global.dart';
import 'active_user_details.dart';

class PendingUserDetails extends StatelessWidget {
  final String name, email, mobileNumber, requestedSubscriptionPlan;

  const PendingUserDetails({
    super.key,
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.requestedSubscriptionPlan,
  });

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
            border: Border.all(color: greenColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: [
              buildUserInfoRow(CupertinoIcons.person, "Name", name),
              buildUserInfoRow(CupertinoIcons.mail, "Email", email),
              buildUserInfoRow(
                  Icons.phone_android, "Mobile Number", mobileNumber),
              buildUserInfoRow(Icons.card_membership_outlined,
                  "Requested Subscription Plan", requestedSubscriptionPlan),
            ],
          ),
        ),
        17.h.verticalSpace,
        Row(
          children: [
            Expanded(
              child: MySubmitButtonFilled(
                width: 0.5.sw,
                title: "Approve",
                fontSize: 18.sp,
                onPressed: () {},
              ),
            ),
            12.w.horizontalSpace,
            Expanded(
                child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 52.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 0.h),
                //21
                decoration: BoxDecoration(
                    border: Border.all(
                      color: greenColor,
                    ),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  "Reject",
                  style: textStyleW700.copyWith(
                      fontSize: 18.sp,
                      color: greenColor),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
