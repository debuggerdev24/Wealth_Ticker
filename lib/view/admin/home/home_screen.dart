import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/model/admin/pay_out_list_model.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/widgets/pay_out_user.dart';
import '../../../core/text_styls.dart';
import '../../../core/theme/app_colors.dart';

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.darkGreenColor,
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark background
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 30.h, 12.w, 5.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              16.h.verticalSpace,
              //todo make custom to this
              topUserTile(
                context: context,
                userName: "Hello Daniel...",
                image:
                    "https://s3-alpha-sig.figma.com/img/d115/5453/d46f4123c6bcd0b0db1ec2d2fd3eb9f2?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=C-kIOWDzX5fznd1Jy1K5ppiXqe9yZHyeVs9FmjTlF1Ti-4Bz9EQXkKiJnm9w8~5Cka3AMv5fVznaKyhSv7QusZx-scmOWDOiNQxCLZrn1oHjS2Vx0wKF5FnJ34O33FmPYkOfyezuALpJFkJfFGXm66L2T1in334wYBBS~-MqyMj3hQXFabcYYS2wgK2YRTmSlGerEYg-MuLNzFLN5nTgEzErr4qLNa2J3VytjzRW38QhkQxwVlQvY6b9hqgk-NOslpYFGt~ArREH84DJ3yFQOKbY~T13Bu12QXi6HPnCCkvMv~7YxyxofFc6nXBn6Kdp5BMEkL9hHi3Cg1XlvreEeA__",
              ),
              22.h.verticalSpace,
              Container(
                width: 1.sw,
                height: 100.h,
                padding: EdgeInsets.only(
                  top: 12.h,
                  left: 20.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  color: Color(0xffcbd6d3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Paid Posts",
                      style: textStyleW600.copyWith(fontSize: 14.sp),
                    ),
                    5.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "152",
                          style: textStyleW700.copyWith(
                            fontSize: 38.sp,
                          ),
                        ),
                        46.w.horizontalSpace,
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Paid posts this week",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 1.sw,
                height: 100.h,
                padding: EdgeInsets.only(
                  top: 12.h,
                  left: 20.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                  color: Color(0xff67827b),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Lucky Draw Entries",
                      style: textStyleW600.copyWith(
                          fontSize: 14.sp, color: Colors.white),
                    ),
                    5.h.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "320",
                          style: textStyleW700.copyWith(
                            color: Colors.white,
                            fontSize: 38.sp,
                          ),
                        ),
                        46.w.horizontalSpace,
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "Paid posts this week",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              24.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payouts Processed",
                    style: textStyleW600.copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    "\$4,500",
                    style: textStyleW700.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.teal,
                    ),
                  ),
                ],
              ),
              10.h.verticalSpace,
              LinearProgressIndicator(
                backgroundColor: Color(0xffe6e6ed),
                value: 0.7,
                borderRadius: BorderRadius.circular(50.r),
                // valueColor: ,
                minHeight: 24.h,
                color: Color(0xff96bf7a),
              ),
              2.h.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: Text("“distributed”"),
              ),
              16.h.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Lucky Draw",
                  style: textStyleW600.copyWith(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              10.h.verticalSpace,
              detailsRow("Current Draw Prize Pool", "\$1,500"),
              detailsRow("Next Draw Countdown", "3 days remaining"),
              23.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payout List",
                    style: textStyleW600.copyWith(
                      color: AppColors.darkGreenColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      index.value = 2;
                      // context.pushNamed(AppRoutes.payOutUsersScreen.name);
                    },
                    child: Text(
                      "See All",
                      style: textStyleW700.copyWith(
                        color: AppColors.teal,
                      ),
                    ),
                  )
                ],
              ),
              14.h.verticalSpace,
              PayOutUserPending(
                user: PayOutUsersModel(
                  amount: 1500,
                  status: false,
                  paymentMethods: "Wise App",
                  requestDate: "Feb 20, 2025",
                  image:
                      "https://s3-alpha-sig.figma.com/img/1690/dcb9/87dc1bcc841b99cd8673f9851b377b59?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=mGyrnuo7s3bKGcGTAFFdj7E2dAoNxe7zDF0b5gsrrhoqS-EsLDnamMpzOOjFLXdquvBwkfMt63ejLSN2EMZaj0DXQQ~2KBYC2YT8r-SFPZHCGV2fUlj4cEPWMlVQYZisGMKJXQAFDA1SyPxTkVxuodBDhU6nMd724fojN63qPv-Gnf0IOoKCud0iBzksGTy7R99MnA~szPHAgDfeCqIRmOScoemkimclc1EtWa~oZ-iPT21kuu5HM~42ojTR3kFci5nyDrO7FXvGa~uGNUxDmFoTxupsMZIgRcmo97I29TtTSLbWuETl4ft7yc4zSyxMs4ATVDL7mz9P35mwT10gQQ__",
                  customerName: "AlexT",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setStatusBarColor() {}
}

Row detailsRow(String title, String answer) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          title,
        ),
      ),
      Text(
        "  :  ",
        style: textStyleW600,
      ),
      Expanded(
        child: Text(
          answer,
          style: textStyleW600,
        ),
      ),
    ],
  );
}

List a = [
  {
    "title": "Total Users :",
    "value": "5000",
  },
  {
    "title": "Active Users :",
    "value": "3,200",
  },
  {
    "title": "New Request :",
    "value": "15",
  },
  {
    "title": "Subscribers:",
    "value": "2,500",
  },
];

class MyBox extends StatelessWidget {
  final String title, value;

  const MyBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.5.sw,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Color(0xffDDE7E4),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp),
          ),
          8.h.verticalSpace,
          Text(
            value,
            style: textStyleW700.copyWith(fontSize: 27.sp),
          ),
        ],
      ),
    );
  }
}
