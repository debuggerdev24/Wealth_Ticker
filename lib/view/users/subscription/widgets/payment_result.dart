import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';

import '../../../../core/widgets/my_button.dart';

class PaymentResult extends StatelessWidget {
  final String image, message, titleButton1, titleButton2;

  const PaymentResult({
    super.key,
    required this.image,
    required this.message,
    required this.titleButton1,
    required this.titleButton2,
    // this.showOnlyOneNextBtn = false,
  });

  // : assert(showOnlyOneNextBtn == false && titleButton != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          15.h.verticalSpace,
          Image.asset(
            image,
            height: 300.h,
            width: 300.h,
          ),
          12.h.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            message,
            style: textStyleW600.copyWith(fontSize: 18.sp),
          ),
          Spacer(),
          MySubmitButtonOutlined(
            title: titleButton1,
            onPressed: () {},
          ),
          12.h.verticalSpace,
          MySubmitButtonFilled(
            title: titleButton2,
            onPressed: () {
              // context.pop();
              context.pushNamed(AppRoutes.failedPaymentScreen.name);
            },
          ),
          20.h.verticalSpace,
        ],
      ),
    );
  }
}
