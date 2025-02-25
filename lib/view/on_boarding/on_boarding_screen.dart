import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../core/utils/global.dart';
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
        padding: EdgeInsets.fromLTRB(10.w, 30.h, 10.w, 5.h),
        child: Stack(
          children: [
            Column(
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
                        description: "“Stay ahead in the stock market with real-time updates on our trades”",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding2,
                        title: "Live Market Updates",
                        description: "“Track our trades, stock prices, trends, and news in real-time.”",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding3,
                        title: "Chat with our Team",
                        description: "“Have any doubts? Don’t worry. Message us directly and we’ll answer all your questions”",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding4,
                        title: "Custom Watchlists & Alerts",
                        description: "“Get instant alerts for our favorite stocks.”",
                        pageController: pageController,
                      ),
                      MyOnBoardingWidget(
                        img: AppAssets.onBoarding5,
                        title: "You’re Ready to Go!",
                        description: "“Start tracking our trades and learn more about markets”",
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
                      dotHeight: 12.h,
                      dotWidth: 12.w,
                      type: WormType.thin,
                      activeDotColor: greenColor),
                ),
                SizedBox(height: 70.h),
                MySubmitButtonFilled(
                  title: onBoardingProviderTrue.currentPage == 0
                      ? "Get Started"
                      : onBoardingProviderTrue.currentPage == 4
                          ? "Let's Go!"
                          : "Next",
                  onPressed: () {
                    onBoardingProviderTrue.currentPage == 4
                        ? context.pushNamed(AppRoutes.homeScreen.name)
                        : pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                  },
                ),
              ],
            ),
            //todo -----------> Skip button
            Padding(
              padding: EdgeInsets.only(top: 8.h, right: 2.w),
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
            SizedBox(height: 35.h)
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
      required this.pageController, this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        70.h.verticalSpace,
        Text(
          title,
          textAlign: TextAlign.center,
          style: textStyleW700.copyWith(color: greenColor, fontSize: 28.sp),
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
