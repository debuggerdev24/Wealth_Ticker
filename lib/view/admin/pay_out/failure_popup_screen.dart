import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/widgets/message_box.dart';

class FailurePopupScreen extends StatelessWidget {
  const FailurePopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Failed Payment",
      body: Padding(
        padding: appPadding(),
        child: Column(
          children: [
            18.h.verticalSpace,
            OutPutMessageBox(
              filledButtonTitle: "Return to PayOutList",
              outLinedButtonTitle: "Retry Payout",
              outlinedButtonOnTap: () {},
              filledButtonOnTap: () {
                context.push(AppRoutes.processPayoutScreen.path);
                // context.pushNamed(AppRoutes.processPayoutScreen.name);
                // context.goNamed(AppRoutes.processPayoutScreen.name,);

              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SVGImages(
                    path: AppAssets.failedCross,
                  ),
                  16.h.verticalSpace,
                  Text(
                    '“Payout failed for User AlexT. Please check details and try again.”',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
