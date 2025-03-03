import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/widgets/message_box.dart';

import '../../../core/routes/routes.dart';
import '../../../core/widgets/svg_images.dart';

class SuccessPopupScreen extends StatelessWidget {
  const SuccessPopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Success",
      body: Padding(
        padding: appPadding(),
        child: OutPutMessageBox(
          outLinedButtonTitle: "Done",
          filledButtonTitle: "Return to Payout List",
          outlinedButtonOnTap: () {
            context.push(AppRoutes.failurePopupScreen.path);
          },
          filledButtonOnTap: () {
            context.pushNamed(AppRoutes.successPopUpScreenAdmin.name);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SVGImages(
                path: AppAssets.successTick,
              ),
              26.h.verticalSpace,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 18.sp,
                  ),
                  children: [
                    TextSpan(
                      text: '“Payout of ',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                    TextSpan(
                      text: "\$1,500 to AlexT",
                      style: textStyleW600.copyWith(
                        color: Colors.black
                      ),
                    ),
                    TextSpan(
                      text: ' has been successfully processed.”',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              10.h.verticalSpace,
              Text(
                "(Redirects to the Payout List after a few seconds.)",
                style: textStyleW600.copyWith(
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
