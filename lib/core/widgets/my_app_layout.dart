import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../theme/app_colors.dart';
import '../utils/global.dart';

class MyAppLayOut extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? centerTitle, showBackButton;
  final Widget body;
  final Widget? leading;
  final List<Widget>? actions;

  const MyAppLayOut(
      {super.key,
      required this.title,
      this.centerTitle = true,
      this.actions = const [SizedBox()],
      required this.body,
      this.showBackButton = true, this.leading});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: actions,
        centerTitle: centerTitle,
        backgroundColor: AppColors.darkGreenColor,
        leading: showBackButton ?? true
            ? GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            : leading,
        title: Text(title, style: appBarTitleStyle()),
      ),
      body: body,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

TextStyle appBarTitleStyle() => textStyleW700.copyWith(
      color: Colors.white,
      fontSize: 18.sp,
    );
