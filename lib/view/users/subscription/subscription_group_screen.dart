import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/global.dart';
import '../../../core/widgets/auth_screen_text.dart';
import '../../../core/widgets/my_app_layout.dart';
import '../../../provider/subscription_plan_provider.dart';

class SubscriptionGroupScreen extends StatelessWidget {
  const SubscriptionGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SubscriptionPlanProvider provider =
        Provider.of<SubscriptionPlanProvider>(context, listen: true);
    SubscriptionPlanProvider providerFalse =
        Provider.of<SubscriptionPlanProvider>(context);
    return MyAppLayOut(
      title: "Subscription group",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  "Unlock Wealth Tickers Excellence With Premium",
                  textAlign: TextAlign.center,
                  style: textStyleW700.copyWith(
                      color: greenColor,
                      fontSize: 18.sp,),
                ),
              ),
              SizedBox(height: 5.h),
              AuthSlogan(text: "Pick the plan that's best for you"),
              SizedBox(height: 26.h),
              //todo ------------------> plan list
              Column(
                spacing: 20.h,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  provider.subscriptionPlans.length,
                  (index) {
                    final plan = provider.subscriptionPlans[index];
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(
                            AppRoutes.selectPaymentMethodScreen.name);
                      },
                      child: Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.r),
                            color: index % 2 == 0
                                ? Color(0xffe6ebe9)
                                : greenColor),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  provider.subscriptionPlans[0].planName,
                                  style: textStyleW700.copyWith(
                                    color: index % 2 == 0
                                        ? greenColor
                                        : Color(0xff66b3a7),
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  "${plan.price}/${plan.duration}",
                                  style: textStyleW700.copyWith(
                                      color: index % 2 == 0
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 16.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                    plan.features.length,
                                    (i) {
                                      return Text(
                                        "•  ${plan.features[i]}",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            height: 1.5,
                                            color: index % 2 == 0
                                                ? Colors.black
                                                : Colors.white),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: FilledButton(
                                      style: FilledButton.styleFrom(
                                          backgroundColor: index % 2 == 0
                                              ? greenColor
                                              : Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 14.w)),
                                      onPressed: () {},
                                      child: Text(
                                        "Select Plan",
                                        style: TextStyle(
                                            color: index % 2 == 0
                                                ? Colors.white
                                                : greenColor),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
