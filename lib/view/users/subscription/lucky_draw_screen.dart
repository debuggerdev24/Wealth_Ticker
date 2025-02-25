import 'package:flutter/material.dart';
import 'package:wealth_ticker_main/view/users/subscription/widgets/payment_result.dart';
import '../../../core/app_assets.dart';
import '../../../core/widgets/my_app_layout.dart';

class LuckyDrawScreen extends StatelessWidget {
  const LuckyDrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Complete Your Subscription",
      body: PaymentResult(
        image: AppAssets.luckyDraw,
        //"assets/images/failed_payment.png",
        message:
            "“Congratulations! You are now entered into the Lucky Draw for this week. Stay tuned for results on Sunday!”",
        titleButton1: "View Post",
        titleButton2: "Go To Home",
      ),
    );
  }
}
