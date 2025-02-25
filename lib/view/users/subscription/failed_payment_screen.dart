import 'package:flutter/material.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/view/users/subscription/widgets/payment_result.dart';

import '../../../core/widgets/my_app_layout.dart';

class FailedPaymentScreen extends StatelessWidget {
  const FailedPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Complete Your Subscription",
      body: PaymentResult(
        image: AppAssets.failedPayment,
        //"assets/images/failed_payment.png",
        message:
            "“Oops! Something went wrong. We couldn't process your payment. Please try again if the issue persists.”",
        titleButton1: "Retry Payment",
        titleButton2: "Cancel",
      ),
    );
  }
}
