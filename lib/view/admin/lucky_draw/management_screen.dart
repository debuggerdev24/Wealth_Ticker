import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/my_text.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import 'package:wealth_ticker_main/view/admin/lucky_draw/widgets/participent_user_tile.dart';

import '../../../provider/admin/lucky_draw_provider.dart';

class LuckyDrawManagementScreenAdmin extends StatelessWidget {
  const LuckyDrawManagementScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    LuckyDrawProvider providerTrue =
        Provider.of<LuckyDrawProvider>(context, listen: true);
    LuckyDrawProvider provider = Provider.of<LuckyDrawProvider>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        index.value = 0;
        return;
      },
      child: MyAppLayOut(
        showBackButton: false,
        title: "Lucky Draw Management",
        actions: [
          GestureDetector(
            onTap: () {
              context.push(AppRoutes.luckyDrawDetailsScreen.path);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.r),
              child: SVGImages(path: AppAssets.editIcon),
            ),
          ),
        ],
        body: Padding(
          padding: appPadding(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.h.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      data: "Next Draw",
                      style: textStyleW600.copyWith(
                          color: Colors.red, fontSize: 18.sp),
                    ),
                    MyText(
                      data: "  :  ",
                      style: textStyleW600.copyWith(
                          color: Colors.red, fontSize: 18.sp),
                    ),
                    Expanded(
                      child: MyText(
                        data: "Sunday, Feb 25, 2025",
                        style: textStyleW600.copyWith(
                            color: Colors.red, fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
                18.h.verticalSpace,
                Text(
                  "Draw Calculation",
                  style: textStyleW600.copyWith(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 1.sw,
                    // height: 150.h,
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 14.w,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(0, 5),
                          blurRadius: 5,
                        ),
                      ],
                      border: Border.all(
                        width: 1.2,
                        color: AppColors.darkGreenColor,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                      color: Color(0xffe6ebe9),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Paid Posts",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text(
                              "150",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                        8.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Percentage Allocated to Draw",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Text(
                              "20%",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                        2.h.verticalSpace,
                        Divider(),
                        2.h.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              data: "Calculated Prize Pool",
                              style: textStyleW600.copyWith(fontSize: 18.sp),
                            ),
                            MyText(
                              data: "\$1,500",
                              style: textStyleW600.copyWith(fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Text(
                  "How the Draw Works",
                  style: textStyleW600.copyWith(fontSize: 16.sp),
                ),
                16.h.verticalSpace,
                Text(
                    '"Each paid post unlocks one entry to this week’s lucky draw. Winners will be announced after the draw ends, and the post becomes free."'),
                10.h.verticalSpace,
                Divider(),
                10.h.verticalSpace,
                Text(
                  "Disclaimer",
                  style: textStyleW600.copyWith(fontSize: 16.sp),
                ),
                16.h.verticalSpace,
                Text(
                  '"Ensure your bank details are updated to receive the prize amount. Only one entry per customer is allowed."',
                ),
                18.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Manage Participants",
                      style: textStyleW600.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.manageParticipantsScreen.path);
                      },
                      child: Text(
                        "View All",
                        style: textStyleW700.copyWith(
                          color: AppColors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
                16.h.verticalSpace,
                Column(
                  spacing: 12.h,
                  children: List.generate(
                    2,
                    (index) {
                      final user = provider.participantUsersList[
                          index % provider.participantUsersList.length];
                      return GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.confirmWinner.path);
                        },
                        child: ParticipantUserTile(
                            image: user.image,
                            title: user.title,
                            numOfPurchasedPost: user.numOfPurchasedPost,
                            customerName: user.customerName),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
