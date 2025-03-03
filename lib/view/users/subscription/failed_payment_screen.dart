import 'package:flutter/material.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/view/users/subscription/widgets/payment_result.dart';

import '../../../core/widgets/my_app_layout.dart';

class FailedPaymentScreenUser extends StatelessWidget {
  const FailedPaymentScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Purchase Failed",
      body: PaymentResult(
        image: AppAssets.failedPayment,
        //"assets/images/failed_payment.png",
        message:
            "“Oops! Something went wrong. We couldn't process your payment. Please try again if the issue persists.”",
        titleButton1: "Retry Payment",
        titleButton2: "Cancel",
        onTapFirst: () {},
        onTapSecond: () {},
      ),
    );
  }
}
