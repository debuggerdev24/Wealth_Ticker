import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/provider/user/home_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.darkGreenColor,
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark background
      ),
    );
    HomeProvider providerTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 30.h, 12.w, 5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              18.h.verticalSpace,
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text("Welcome Daniel...",
                    style: textStyleW700.copyWith(
                        color: AppColors.darkGreenColor, fontSize: 20.sp)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.profileScreen.path);
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/631a/e9d1/8913573857117663f71ac91bd6180688?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=IXXFUJ-l84XxqJgy95pyOjsqAoNEGChTWDNwJlanDN3I4RxlQSJIfnNBWEwb4kGHfYOHGut188SUsG~9uTEJUyrAZtez9Akyhw3xVNDfOuSAC7FcYETVPUyou2I-azHDH5RpOjDVB3slFVNUnfUojhUbbtg6Ib8q1DSX0M-UcqqvzbM~hid784~ImURB~M9jeKT5GYtS~wImwpSkrOCinhb4Xt-bj4GK5sgF~cw5ZevEcybSEsPZkJMWzGk5Rgt-P3gpJU9nn6flASOOI2gsuSYK4qq46Qy8s1crEGQltBPbT-sFfme-dP8ZY6pd0Vj8M02Vd3AHpn7~ZBIzlZbktA__"),
                        radius: 23.r,
                      ),
                    ),
                    10.w.horizontalSpace,
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Icon(CupertinoIcons.bell),
                    )
                  ],
                ),
              ),
              25.h.verticalSpace,
              Text(
                "Stock Market Analysis :",
                style: textStyleW600.copyWith(fontSize: 18.sp),
              ),
              ...List.generate(
                provider.postList.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 1.sw,
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Color(0xffD9E0DE),
                              border: Border.all(color: AppColors.darkGreenColor)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "1. Market Update",
                                style: textStyleW600.copyWith(fontSize: 16.sp),
                              ),
                              10.h.verticalSpace,
                              Text(
                                  "The S&P 500 closed 1.2% higher today, driven by gains in the tech and energy sectors. Watch for tomorrow's inflation data release, which could impact market sentiment."),
                            ],
                          ),
                        ),
                        14.h.verticalSpace,
                        Row(
                          spacing: 11.w,
                          children: [
                            Expanded(
                              child: MySubmitButtonFilled(
                                fontSize: 16.sp,
                                title: "\$5.99",
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: MySubmitButtonOutlined(
                                title: "Pay to Access",
                                fontSize: 16.sp,
                                onPressed: () {
                                  context.pushNamed(
                                      AppRoutes.selectPaymentMethodScreen.name);
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// GridView.builder(
//                 padding: EdgeInsets.zero,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 1.6,
//                     crossAxisSpacing: 11.h,
//                     mainAxisSpacing: 11.h),
//                 itemCount: 4,
//                 itemBuilder: (context, index) {
//                   return MyBox(
//                     title: a[index]["title"],
//                     value: a[index]["value"],
//                   );
//                 },
//               ),
//Row(
//                   children: [
//                     CircleAvatar(
//                         radius: 28.w,
//                         backgroundImage: NetworkImage(
//                             "https://plus.unsplash.com/premium_photo-1661389625547-e4977d5727a6?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG9mZmljZSUyMG1lZXRpbmd8ZW58MHx8MHx8fDA%3D")),
//                     SizedBox(
//                       width: 12.h,
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Stock Talk",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 16.sp),
//                               ),
//                               Spacer(),
//                               Text("03:04")
//                             ],
//                           ),
//                           Text(
//                             "Admin : Tech stocks are rallying today!",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 )
