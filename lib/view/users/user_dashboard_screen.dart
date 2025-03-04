import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/view/users/earnings/count_down_week_lucky_draw_screen.dart';
import 'package:wealth_ticker_main/view/users/home/home_screen.dart';
import 'package:wealth_ticker_main/view/users/profile/user_profile_screen.dart';
import '../../core/theme/app_colors.dart';
import 'my_post/purchased_post_list_screen.dart';

final ValueNotifier<int> indexTabUser = ValueNotifier<int>(0);

List pages = [
  HomeScreen(),
  PurchasedPostList(),
  WeekLuckyDrawScreen(),
  ProfileScreen(),
];

class UserDashBoardScreen extends StatelessWidget {
  const UserDashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: indexTabUser,
      builder: (BuildContext context, int value, Widget? child) {
        return Scaffold(
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
                myBottomBrItem(AppAssets.myPostIcon, "My Post", 1),
                myBottomBrItem(AppAssets.earnings, "Earnings", 2),
                myBottomBrItem(AppAssets.profileIcon, "Profile", 3),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myBottomBrItem(String iconPath, String title, int index) {
    bool isCurrent = index == indexTabUser.value;
    return GestureDetector(
      onTap: () {
        indexTabUser.value = index;
      },
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(horizontal: isCurrent ? 16.w : 22.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomLeft: Radius.circular(index == 0 ? 0.r : 10.r),
            bottomRight: Radius.circular(index == 3 ? 0.r : 10.r),
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
  //               backgroundColor: AppColors.darkGreenColor,
  //               selectedItemColor: Colors.white,
  //               unselectedItemColor: Colors.grey,
  //               showUnselectedLabels: false,
  //               type: BottomNavigationBarType.fixed,
  //               currentIndex: value,
  //               items: [
  //                 _item(AppAssets.homeIcon, "Home",0),
  //                 _item(AppAssets.myPostIcon, "My Post",1),
  //                 _item(AppAssets.earnings, "Earnings",2),
  //                 _item(AppAssets.profileIcon, "Profile",3),
  //               ],
  //               onTap: (value) {
  //                 // provider.changeTab(value);
  //                 indexTabUser.value = value;
  //               },
  //             ),

  // BottomNavigationBarItem _item(String icon, String label) {
  //   return BottomNavigationBarItem(
  //     backgroundColor: Colors.white,
  //     label: label,
  //     icon: SVGImages(path: icon),
  //   );
  // }

  // BottomNavigationBarItem _item(String icon, String label, int index) {
  //   return BottomNavigationBarItem(
  //     label: '',
  //     icon: ValueListenableBuilder<int>(
  //       valueListenable: indexTabUser,
  //       builder: (context, value, child) {
  //         bool isSelected = value == index;
  //         return Container(
  //           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //           decoration: BoxDecoration(
  //             color: isSelected ? Colors.grey.shade600 : Colors.transparent,
  //             borderRadius: BorderRadius.circular(12), // Rounded corners
  //           ),
  //           child: Column(
  //             children: [
  //               SVGImages(path: icon),
  //               Text(
  //                 label,
  //                 style: TextStyle(
  //                   color: Colors.white, // Text color
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
