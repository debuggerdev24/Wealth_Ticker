import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/model/admin/pay_out_list_model.dart';

class PayOutUserPending extends StatelessWidget {
  final PayOutModel user;

  const PayOutUserPending({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppColors.borderColor,
            ),
            color: AppColors.lightCreamColor,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.image,
                    ),
                  ),
                  10.w.horizontalSpace,
                  Text(
                    user.customerName,
                    style: textStyleW700.copyWith(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
              10.h.verticalSpace,
              _detailsRow(title: "Amount", value: user.amount.toString()),
              _detailsRow(
                  title: "Status",
                  value: user.status ? "Processed" : "Pending"),
              _detailsRow(title: "Payment Method", value: user.paymentMethods),
              _detailsRow(title: "Request Date", value: user.requestDate),
            ],
          ),
        ),
        MySubmitButtonOutlined(
          width: 0.42.sw,
          height: 48.h,
          title: "Process Payout",
          fontSize: 15.sp,
          onPressed: () {
            context.push(AppRoutes.processPayoutScreen.path);
          },
        ),
      ],
    );
  }

  Widget _detailsRow({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: textStyleW600.copyWith(fontSize: 16.sp),
            ),
          ),
          Text(
            "  :   ",
            style: textStyleW700.copyWith(fontSize: 16.sp),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}


class PayOutUserProcessed extends StatelessWidget {
  final PayOutModel user;

  const PayOutUserProcessed({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: AppColors.borderColor,
            ),
            color: AppColors.lightCreamColor,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.image,
                    ),
                  ),
                  10.w.horizontalSpace,
                  Text(
                    user.customerName,
                    style: textStyleW700.copyWith(
                      fontSize: 16.sp,
                    ),
                  )
                ],
              ),
              10.h.verticalSpace,
              _detailsRow(title: "Amount", value: user.amount.toString()),
              _detailsRow(
                  title: "Status",
                  value: user.status ? "Processed" : "Pending"),
              _detailsRow(title: "Payment Method", value: user.paymentMethods),
              _detailsRow(title: "Request Date", value: user.requestDate),
            ],
          ),
        ),
        MySubmitButtonOutlined(
          width: 0.42.sw,
          height: 48.h,
          title: "Process Payout",
          fontSize: 15.sp,
          onPressed: () {
            context.push(AppRoutes.processPayoutScreen.path);
          },
        ),
      ],
    );
  }

  Widget _detailsRow({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: textStyleW600.copyWith(fontSize: 16.sp),
            ),
          ),
          Text(
            "  :   ",
            style: textStyleW700.copyWith(fontSize: 16.sp),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
