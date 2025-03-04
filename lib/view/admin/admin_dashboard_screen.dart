import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/view/admin/home/home_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/payout_list_screen.dart';
import 'package:wealth_ticker_main/view/admin/post/post_management_screen.dart';
import 'package:wealth_ticker_main/view/admin/profile/admin_profile.dart';
import 'package:wealth_ticker_main/view/users/user_dashboard_screen.dart';
import '../../core/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/svg_images.dart';
import 'lucky_draw/management_screen.dart';

final ValueNotifier<int> indexTabAdmin = ValueNotifier<int>(0);

List pages = [
  HomeScreenAdmin(),
  LuckyDrawManagementScreenAdmin(),
  PayoutUsersListScreen(),
  PostManagementScreen(),
  AdminProfileScreen()
];

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: indexTabAdmin,
      builder: (BuildContext context, int value, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: pages[value],
          bottomNavigationBar: Container(
            height: 78.h,
            width: 1.sw,
            decoration: BoxDecoration(
                color: AppColors.darkGreenColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14.r),
                    topLeft: Radius.circular(14.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myBottomBrItem(AppAssets.homeIcon, "Home", 0),
                myBottomBrItem(AppAssets.luckyDrawIcon, "Lucky draw", 1),
                myBottomBrItem(AppAssets.payOutIcon, "Pay Out", 2),
                myBottomBrItem(AppAssets.myPostIcon, " Post ", 3),
                myBottomBrItem(AppAssets.profileIcon, "Profile", 4),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myBottomBrItem(String iconPath, String title, int index) {
    bool isCurrent = index == indexTabAdmin.value;
    return GestureDetector(
      onTap: () {
        indexTabAdmin.value = index;
      },
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(
          horizontal: isCurrent
              ? index == 1
                  ? 12.w
                  : 16.w
              : 20.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomLeft: Radius.circular(index == 0 ? 0.r : 10.r),
            bottomRight: Radius.circular(index == 4 ? 0.r : 10.r),
          ),
          color: isCurrent
              ? Colors.white.withValues(alpha: 0.45)
              : Colors.transparent,
        ),
        duration: Duration(milliseconds: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SVGImages(
              path: iconPath,
            ),
            3.h.verticalSpace,
            isCurrent
                ? Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  // BottomNavigationBar(
  //             backgroundColor: AppColors.darkGreenColor,
  //             selectedItemColor: Colors.white,
  //             unselectedItemColor: Colors.grey,
  //             showUnselectedLabels: false,
  //             type: BottomNavigationBarType.fixed,
  //             currentIndex: value,
  //             items: [
  //               _item(AppAssets.homeIcon, "Home"),
  //               _item(AppAssets.luckyDrawIcon, "Lucky draw"),
  //               _item(AppAssets.payOutIcon, "Pay Out"),
  //               _item(AppAssets.myPostIcon, "My Post"),
  //               _item(AppAssets.profileIcon, "Profile"),
  //               // _item(AppAssets.staffsIcon, "Staffs"),
  //             ],
  //             onTap: (value) {
  //               // provider.changeTab(value);
  //               index.value = value;
  //             },
  //           ),

  BottomNavigationBarItem _item(String icon, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: SVGImages(path: icon),
    );
  }
}
