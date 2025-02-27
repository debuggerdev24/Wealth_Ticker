import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';

class UserRoleScreen extends StatefulWidget {
  const UserRoleScreen({super.key});

  @override
  State<UserRoleScreen> createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
  String _selectedRole = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectRoleTab(
              title: "User",
              onTap: () {
                context.push(AppRoutes.userDashBoardScreen.path);
                setState(() {
                  _selectedRole = "User";
                });
              },
            ),
            selectRoleTab(
              title: "Admin",
              onTap: () {
                context.push(AppRoutes.adminDashBoardScreen.path);
                setState(() {
                  _selectedRole = "Admin";
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget selectRoleTab({
    required String title,
    VoidCallback? onTap,
  }) {
    bool isSelected = _selectedRole == title;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        height: 120.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.blue.shade600,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: textStyleW600.copyWith(
            fontSize: 23.sp,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
