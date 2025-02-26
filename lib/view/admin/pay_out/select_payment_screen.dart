import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';

class SelectPaymentScreen extends StatelessWidget {
  const SelectPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Select payment",
      body: Padding(
        padding: appPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            18.h.verticalSpace,
            Text(
              "Choose Payment Method :",
              style: textStyleW600.copyWith(
                fontSize: 18.sp,
              ),
            ),
            20.h.verticalSpace,
            Container(
              padding: EdgeInsets.only(left: 16.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor)
              ),
              child: ListTile(
                onTap: (){
                  context.push(AppRoutes.confirmationSectionScreen.path);
                },
                contentPadding: EdgeInsets.zero,
                leading: SVGImages(path: AppAssets.creditCard),
                title: Text(" Wise App"),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_right_rounded,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
