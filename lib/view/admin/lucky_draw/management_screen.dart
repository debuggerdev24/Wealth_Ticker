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

class LuckyDrawManagementScreenAdmin extends StatelessWidget {
  const LuckyDrawManagementScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Lucky Draw Management",
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10.r),
          child: SVGImages(path: AppAssets.editIcon),
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
                children: [
                  Text(
                    "Next Draw",
                    style: textStyleW600.copyWith(
                        color: Colors.red, fontSize: 18.sp),
                  ),
                  Text(
                    "  :  ",
                    style: textStyleW600.copyWith(
                        color: Colors.red, fontSize: 18.sp),
                  ),
                  Expanded(
                    child: Text(
                      "Sunday, Feb 25, 2025",
                      style: textStyleW600.copyWith(
                          color: Colors.red, fontSize: 18.sp),
                    ),
                  ),
                ],
              ),
              26.h.verticalSpace,
              Text(
                "Draw Calculation",
                style: textStyleW600.copyWith(fontSize: 16),
              ),
              GestureDetector(
                onTap: () {
                  context.push(AppRoutes.luckyDrawDetailsScreen.path);
                },
                child: Container(
                  width: 1.sw,
                  // height: 150.h,
                  margin: EdgeInsets.only(top: 16.h),
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 14.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
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
                      5.h.verticalSpace,
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
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Calculated Prize Pool",
                            style: textStyleW600.copyWith(fontSize: 18.sp),
                          ),
                          Text(
                            "\$1,500",
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
                          color: AppColors.lightCreamColor),
                    ),
                  ),
                ],
              ),
              16.h.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffcbd6d3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5.h,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 20.r,
                    backgroundImage: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/312b/e8dc/8883945272046356095fc20da211d690?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OAQPsjBnLQLR-p6uAFx7cfXSF90KngCmxLTnKOFoa3CeZEchX8ODAC68639sMPqMY~Iqmet3dqS6JxryMSwR0oCucUPjFN94oQNPqBFzTl9o7aCA7SwIzw4iagrpwrA7Rmjf~0sp-TUZL86ueShiq~9lIygeCi9ThgF39-0Zzko65gW~r8DfX1yiKjLB20Ud6lOCiJU1xFnXk7XiDRcrH4dxLrz4a5H4iIbpg6ML6hQe6ue83EnvjkYgt~3xYOtDdOBJflp6FgtNl9QKvAQ3uXp9kQI4ACuiU45ZmL1lwisv-x6PZguF2IqJtg7xf5SxLWH3mp8Frm3ew3Lger-ftg__"),
                  ),
                  title: Text(
                    "Stock Talk",
                    style: textStyleW600,
                  ),
                  subtitle: Text("Customer Name : Chloe Young"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class UserManagement extends StatelessWidget {
//   const UserManagement({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: greenColor,
//           title: Text(
//             "User Management",
//             style: textStyleW700.copyWith(
//                 color: Colors.white,
//                 fontSize: 18.sp,),
//           ),
//         ),
//         body: Column(
//           children: [
//             //todo ----------------> top bar
//             myTabBar(),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 5.h),
//                 child: TabBarView(children: [
//                   Active(),
//                   Pending(),
//                   Suspended(),
//                 ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget myTabBar() {
//     return Container(
//       width: 1.sw,
//       height: 55.h,
//       margin: EdgeInsets.only(bottom: 20.h),
//       decoration: BoxDecoration(color: Color(0xffededed), boxShadow: [
//         BoxShadow(
//           color: Colors.grey.shade400, // Light shadow
//           spreadRadius: 0, // No spreading to sides
//           blurRadius: 8, // Soft shadow
//           offset: Offset(0, 4), // Moves shadow only downward
//         ),
//       ]),
//       padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
//       child: TabBar(
//         tabAlignment: TabAlignment.fill,
//         // indicatorAnimation: TabIndicatorAnimation.elastic,
//         labelStyle: textStyleW700.copyWith(
//           color: greenColor,
//           fontSize: 18.sp,
//         ),
//         dividerColor: Colors.transparent,
//         indicatorColor: greenColor,
//         indicatorSize: TabBarIndicatorSize.label,
//         // indicatorWeight: 1,
//         isScrollable: false,
//         unselectedLabelStyle: TextStyle(
//           fontWeight: FontWeight.normal,
//           color: Colors.grey.shade700,
//         ),
//         // unselectedLabelColor: Colors.grey.shade700,
//         tabs: [
//           Tab(
//             child: Text(
//               "Active ",
//               style: TextStyle(fontSize: 16.sp),
//             ),
//           ),
//           Tab(
//             child: Text(
//               "Pending",
//               style: TextStyle(fontSize: 16.sp),
//             ),
//           ),
//           Tab(
//             child: Text(
//               "Suspended",
//               style: TextStyle(fontSize: 16.sp),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Active extends StatelessWidget {
//   const Active({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ActiveUserDetails(
//             name: "Aarav Shah",
//             email: "AaravShah@email.com",
//             mobile: "+91 62515 55419",
//             subscriptionPlan: "Basic",
//             groupMembership: "1 Group Join",
//             buttonTitle: "Suspend",
//           ),
//           26.h.verticalSpace,
//           ActiveUserDetails(
//             name: "Alice Smith",
//             email: "alice@email.com",
//             mobile: "+45 62515 55419 ",
//             subscriptionPlan: "Premium",
//             groupMembership: "5 Group Join",
//             buttonTitle: "Suspend",
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Pending extends StatelessWidget {
//   const Pending({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           PendingUserDetails(
//             name: "Elena García",
//             email: "JoneDue@email.com",
//             mobileNumber: "+34 612 345 678",
//             requestedSubscriptionPlan: "Basic",
//           ),
//           26.h.verticalSpace,
//           PendingUserDetails(
//               name: "Hana Takahashi",
//               email: "Hana@email.com",
//               mobileNumber: "+81 90-1234-5678",
//               requestedSubscriptionPlan: "Standard Plan")
//         ],
//       ),
//     );
//   }
// }
//
// class Suspended extends StatelessWidget {
//   const Suspended({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ActiveUserDetails(
//             name: "Noah Dubois",
//             email: "Noah@email.com",
//             mobile: "+33 7 98 76 54 32",
//             subscriptionPlan: "Standard Plan",
//             groupMembership: "3 Group Join",
//             buttonTitle: "Reactivate",
//           ),
//         ],
//       ),
//     );
//   }
// }
