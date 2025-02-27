import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/widgets/message_box.dart';

class ConfirmSectionScreen extends StatelessWidget {
  const ConfirmSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Confirm Section",
      body: Padding(
        padding: appPadding(),
        child: Column(
          children: [
            18.h.verticalSpace,
            OutPutMessageBox(
              filledButtonTitle: "Confirm & Process Payout",
              outLinedButtonTitle: "Cancel",
              outlinedButtonOnTap: () {},
              filledButtonOnTap: () {
                context.push(AppRoutes.successPopUpScreen.path);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SVGImages(
                    path: AppAssets.warning,
                  ),
                  26.h.verticalSpace,
                  Text(
                    '"Once processed, this action cannot be undone. Please verify the details before proceeding."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
