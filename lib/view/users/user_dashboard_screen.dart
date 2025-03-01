import 'package:flutter/material.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/view/users/earnings/count_down_week_lucky_draw_screen.dart';
import 'package:wealth_ticker_main/view/users/home/home_screen.dart';
import 'package:wealth_ticker_main/view/users/profile/profile_screen.dart';
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
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.darkGreenColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: value,
            items: [
              _item(AppAssets.homeIcon, "Home"),
              _item(AppAssets.myPostIcon, "My Post"),
              _item(AppAssets.earnings, "Earnings"),
              _item(AppAssets.profileIcon, "Profile"),
            ],
            onTap: (value) {
              // provider.changeTab(value);
              indexTabUser.value = value;
            },
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _item(String icon, String label) {
    return BottomNavigationBarItem(
      label: label,
      icon: SVGImages(path: icon),
    );
  }
}
