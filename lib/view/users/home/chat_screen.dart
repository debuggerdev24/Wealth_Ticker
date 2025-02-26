import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/view/users/home/widgets/chat_bubble.dart';

import '../../../core/routes/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/global.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 7,
        centerTitle: false,
        backgroundColor: AppColors.darkGreenColor,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.groupScreen.name);
          },
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Stock Talk ",
                   style: textStyleW700.copyWith(color: Colors.white,fontSize: 20.sp)
                  // GoogleFonts.openSans(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20.sp),
                  ),
              TextSpan(
                text: "25 member",
                style: TextStyle(fontSize: 12.sp, color: Colors.white70),
              )
            ]),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 18.h, 12.w, 5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Today",
                    style: textStyleW700.copyWith(
                        color: AppColors.darkGreenColor),
                  ),
                ),
                20.h.verticalSpace,
                ChatBubble(
                  message:
                      "Apple (AAPL) dropped after the Fed announcement. Watch support at 170 for a possible rebound.",
                  time: "2.06 PM",
                  userName: '',
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 46.h,
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              color: AppColors.darkGreenColor,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Only", style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: " Admin", style: TextStyle(color: Colors.red)),
                    TextSpan(
                        text: " Can send message",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
