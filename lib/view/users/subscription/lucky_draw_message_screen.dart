import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import 'package:wealth_ticker_main/view/users/subscription/widgets/payment_result.dart';
import 'package:wealth_ticker_main/view/users/user_dashboard_screen.dart';
import '../../../core/app_assets.dart';
import '../../../core/widgets/my_app_layout.dart';

class LuckyDrawMessageScreen extends StatelessWidget {
  const LuckyDrawMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Complete Your Subscription",
      body: PaymentResult(
        image: AppAssets.luckyDrawMessage,
        //"assets/images/failed_payment.png",
        message: "“Congratulations! You are now entered into the Lucky Draw for this week. Stay tuned for results on Sunday!”",
        titleButton1: "View Post",
        titleButton2: "Go To Home",
        onTapFirst: () {
          indexTabUser.value = 1;
          context.goNamed(AppRoutes.userDashBoardScreen.name);
        },
        onTapSecond: () {},
      ),
    );
  }
}
