import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import '../../../core/text_styls.dart';
import '../../../core/widgets/my_app_layout.dart';
import '../../../core/widgets/my_button.dart';

class SuccessPaymentScreen extends StatelessWidget {
  const SuccessPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Complete Your Subscription",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.h.verticalSpace,
            Image.asset(
              AppAssets.successPayment,
              height: 300.h,
              width: 300.h,
            ),
            22.h.verticalSpace,
            Text(
              textAlign: TextAlign.center,
              '“Thank you for your purchase! You now have full access to the post. “',
              style: textStyleW600.copyWith(fontSize: 18.sp),
            ),
            Spacer(),
            12.h.verticalSpace,
            MySubmitButtonFilled(
              title: "Next",
              onPressed: () {
                // context.pop();
                context.pushNamed(AppRoutes.luckyDrawScreen.name);
              },
            ),
            20.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
