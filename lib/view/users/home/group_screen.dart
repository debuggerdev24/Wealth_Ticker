import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/global.dart';

import '../../../core/widgets/my_app_layout.dart';
import '../../../provider/notification_provider.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationProvider provider = Provider.of<NotificationProvider>(context);
    NotificationProvider providerTrue =
        Provider.of<NotificationProvider>(context, listen: true);
    return MyAppLayOut(
      title: "Stock Talk",
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
          color: Colors.white,
        )
      ],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Container(
                height: 115.h,
                width: 115.w,
                margin: EdgeInsets.only(bottom: 8),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                child: ClipOval(
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder:
                        AssetImage("assets/images/auth_screen/on_b2.png"),
                    image: NetworkImage(
                        "https://plus.unsplash.com/premium_photo-1661389625547-e4977d5727a6?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fG9mZmljZSUyMG1lZXRpbmd8ZW58MHx8MHx8fDA%3D"),
                    fadeInDuration: Duration(seconds: 1),
                    fadeOutDuration: Duration(milliseconds: 200),
                  ),
                ),
              ),
              Text(
                "1 Members",
                style: textStyleW500.copyWith(
                  color: AppColors.darkGreenColor,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                  textAlign: TextAlign.center,
                  '"Stay ahead with real-time stock insights and market discussions."'),
              SizedBox(height: 26.h),
              ListTile(
                title: Text("Notification"),
                contentPadding: EdgeInsets.zero,
                leading: Icon(CupertinoIcons.bell),
                trailing: CupertinoSwitch(
                  value: providerTrue.isGroupNotificationOn,
                  onChanged: (value) {
                    provider.toggleSwitchNotification();
                  },
                  activeTrackColor: AppColors.darkGreenColor,
                ),
              ),
              Divider(),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "1 Members",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                trailing: Icon(CupertinoIcons.search, color: AppColors.darkGreenColor),
              ),
              // SizedBox(height: 26.h),
              ListTile(
                onTap: () {
                  context.pushNamed(AppRoutes.oneToOneChat.name);
                },
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://static.vecteezy.com/system/resources/thumbnails/000/439/863/small_2x/Basic_Ui__28186_29.jpg"),
                ),
                title: Text("Ethan Carter"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
