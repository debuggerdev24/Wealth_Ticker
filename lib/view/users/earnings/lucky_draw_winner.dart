import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/provider/user/earning_provider.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/widget/winners_tile.dart';
import 'package:wealth_ticker_main/view/users/user_dashboard_screen.dart';
import '../../../core/app_assets.dart';

class LuckyDrawWinnerScreen extends StatelessWidget {
  const LuckyDrawWinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EarningsProvider providerTrue =
        Provider.of<EarningsProvider>(context, listen: true);
    EarningsProvider provider =
        Provider.of<EarningsProvider>(context, listen: false);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        indexTabUser.value = 0;
        return;
      },
      child: MyAppLayOut(
        showBackButton: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 10.w,
            ),
            child: GestureDetector(
                onTap: () {
                  context.push(AppRoutes.bankDetailsScreen.path);
                },
                child: SVGImages(path: AppAssets.bankEdit)),
          ),
        ],
        title: "Lucky Draw Winners",
        body: Padding(
          padding: appPadding(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      height: 180.h,
                      width: 210.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/054c/786b/8d929ba332f2bed6ef20981d72b96fad?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PDxBUcq6JCVrFDCQnVIcfd64rygbHfBs5iXbx3JRKMiaiQdpmRbOkp5lBno27uunECzdyLY5TWBo~xYxUpUiWMnQ~9hPv6lzxcefGKh2BzwEdio8PFfitBrRMgRYsjGmmpH4A8UOuQbxBhX4A53J9ktSviEpCRzKypTYkGsnvk8jGWSIFa5JUF9L-6u0sv13HN-r04l1p-rUrAVlId5K2WgbferR7yvWonagGtE3cm3F-i-fGdeO17o~nj4wAZ5vTVerXPGQVhjNkk34O272jNueTza7IC0fnG3QhKH9TH59Pj95F3csDTxFgJm44sxbYTN7S15rM6yXKkQMHeCylA__",
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '"Congratulations to the Latest Winners!"',
                      style: textStyleW700.copyWith(
                        color: AppColors.darkGreenColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    8.h.verticalSpace,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Zoe Martin",
                            style: textStyleW600.copyWith(
                                fontSize: 14.sp,
                                color: Color(0xff333333),
                                fontFamily: "Open Sans"),
                          ),
                          TextSpan(
                            text: " \$1,500",
                            style: textStyleW700.copyWith(
                                fontSize: 18.sp,
                                color: Colors.green,
                                fontFamily: "Open Sans"),
                          ),
                        ],
                      ),
                    ),
                    20.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Past Lucky Draw Winners :",
                          style: textStyleW600.copyWith(fontSize: 16.sp),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoutes.pastWinnersScreen.name);
                          },
                          child: Text(
                            "View All",
                            style: textStyleW600.copyWith(
                                color: Color(0xff329788), fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                    16.h.verticalSpace,
                    ...List.generate(
                      providerTrue.pastWinners.length,
                      (index) {
                        final winner = providerTrue.pastWinners[index];
                        return WinnersTile(winner: winner);
                      },
                    ),
                  ],
                ),
                14.h.verticalSpace,
                Divider(height: 0),
                _title("How the Draw Works :"),
                Text(
                    '"Each paid post unlocks one entry to this week’s lucky draw. Winners will be announced after the draw ends, and the post becomes free."'),
                20.h.verticalSpace,
                Divider(height: 0),
                _title("Disclaimer :"),
                Text(
                    '"Ensure your bank details are updated to receive the prize amount. Only one entry per customer is allowed."'),
                20.h.verticalSpace,
                Divider(height: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _title(String title) {
  return Padding(
    padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
    child: Text(
      title,
      style: textStyleW600.copyWith(
        fontSize: 16.sp,
      ),
    ),
  );
}

Widget _detailsWidget({required String title, required String data}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12.h),
    child: Row(
      children: [
        Text(title),
        Text("  :  "),
        Expanded(
          child: Text(data),
        ),
      ],
    ),
  );
}
