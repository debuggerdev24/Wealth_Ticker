import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../core/theme/app_colors.dart';
import '../../core/routes/routes.dart';
import '../../core/widgets/auth_screen_text.dart';
import '../../core/widgets/my_button.dart';
import '../../provider/auth/on_boarding_provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingProvider onBoardingProviderTrue =
        Provider.of<OnBoardingProvider>(context, listen: true);
    OnBoardingProvider onBoardingProviderFalse =
        Provider.of<OnBoardingProvider>(context, listen: false);
    PageController pageController = PageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 0.h),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      onBoardingProviderFalse.pageIndex(index);
                    },
                    children: [
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding1,
                        title: "Welcome to\nWealth Tickers",
                        description:
                            "“Stay ahead in the stock market with real-time updates on our trades”",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding2,
                        title: "Live Market Updates",
                        description:
                            "“Track our trades, stock prices, trends, and news in real-time.”",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding3,
                        title: "Lucky Draw Winners",
                        description:
                            "\"Congrats to this week's winners! Stay tuned for the next draw.\"",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding4,
                        title: "Custom Watch lists \n& Alerts",
                        description:
                            "“Get instant alerts for our favorite stocks.”",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding5,
                        title: "You’re Ready to Go!",
                        description:
                            "“Start tracking our trades and learn more about markets”",
                        pageController: pageController,
                      ),
                      // MyOnBoardingWidget(img: "assets/images/auth_screen/on_b1.png", title: "cecece", description: "cee"),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 5,
                  onDotClicked: (index) {
                    onBoardingProviderFalse.pageIndex(index);
                    pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut);
                  },
                  effect: WormEffect(
                      spacing: 4.w,
                      dotHeight: 7.h,
                      dotWidth: 7.w,
                      type: WormType.thin,
                      activeDotColor: AppColors.darkGreenColor),
                ),
                115.h.verticalSpace,
                MySubmitButtonFilled(
                  title: onBoardingProviderTrue.currentPage == 0
                      ? "Get Started"
                      : onBoardingProviderTrue.currentPage == 4
                          ? "Let's Go!"
                          : "Next",
                  onPressed: () {
                    onBoardingProviderTrue.currentPage == 4
                        ? context.push(AppRoutes.userRoleScreen.path)
                        : pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                  },
                ),
                22.h.verticalSpace,
              ],
            ),
            //todo -----------> Skip button
            Padding(
              padding: EdgeInsets.only(top: 14.h, right: 2.w),
              child: Align(
                alignment: Alignment.topRight,
                child: AuthSlogan(
                  text: "Skip",
                  onTap: () {
                    context.pushNamed(AppRoutes.homeScreen.name);
                  },
                ),
              ),
            ),
            35.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}

class MyOnBoardingWidget extends StatelessWidget {
  final double? height;
  final String img, title, description;
  final PageController pageController;

  const MyOnBoardingWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.description,
      required this.pageController,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        70.h.verticalSpace,
        Text(
          title,
          textAlign: TextAlign.center,
          style: textStyleW700.copyWith(
              color: AppColors.darkGreenColor, fontSize: 28.sp),
        ),
        5.h.verticalSpace,
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        10.h.verticalSpace,
        Image.asset(img),
      ],
    );
  }
}
