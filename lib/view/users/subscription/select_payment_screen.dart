import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';

import '../../../core/routes/routes.dart';
import '../../../core/widgets/my_app_layout.dart';
import '../../../core/widgets/svg_images.dart';

class SelectPaymentMethodeScreen extends StatelessWidget {
  const SelectPaymentMethodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Select payment",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.h.verticalSpace,
            Text(
              "Choose Payment Method :",
              style: textStyleW700.copyWith(fontSize: 18.sp),
            ),
            myPaymentTile(
              image: AppAssets.googlePaymentImage, //"assets/images/google.svg",
              paymentName: " Google Pay",
              onTap: () {},
            ),
            myPaymentTile(
              image: AppAssets.applePaymentImage, //"assets/images/apple.svg",
              paymentName: " Apple Pay",
              onTap: () {},
            ),
            myPaymentTile(
              image: AppAssets.cardImage, //"assets/images/card.svg",
              paymentName: " Credit/Debit Cards",
              onTap: () {
                context.pushNamed(AppRoutes.cardPaymentScreen.name);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget myPaymentTile(
      {required String image,
      required String paymentName,
      required VoidCallback onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      margin: EdgeInsets.only(top: 21.h),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: ListTile(
        onTap: onTap,
        leading: SVGImages(iconPath: image),
        title: Text(
          paymentName,
          style: TextStyle(fontSize: 16.sp),
        ),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
    );
  }
}
