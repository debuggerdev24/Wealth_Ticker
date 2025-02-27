import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wealth_ticker_main/view/admin/home/home_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/payout_list_screen.dart';
import 'package:wealth_ticker_main/view/admin/post/post_management_screen.dart';
import '../../core/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/global.dart';
import '../../core/widgets/svg_images.dart';
import 'lucky_draw/management_screen.dart';

final ValueNotifier<int> index = ValueNotifier<int>(0);

List pages = [
  HomeScreenAdmin(),
  LuckyDrawManagementScreenAdmin(),
  PayoutUsersListScreen(),
  PostManagementScreen(),
];

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: index,
      builder: (BuildContext context, int value, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
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
              _item(AppAssets.luckyDrawIcon, "Lucky draw"),
              _item(AppAssets.payOutIcon, "Pay Out"),
              _item(AppAssets.myPostIcon, "My Post"),
              // _item(AppAssets.staffsIcon, "Staffs"),
            ],
            onTap: (value) {
              // provider.changeTab(value);
              index.value = value;
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


