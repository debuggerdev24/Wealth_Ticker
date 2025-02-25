import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/global.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerHeader(
        padding: EdgeInsets.zero,
        child: ListView(
          children: [
            DrawerHeader(
              // padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: greenColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Ethan Carter",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "+1 (415) 892-5302",
                      style: TextStyle(color: Colors.white70),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/000/439/863/small_2x/Basic_Ui__28186_29.jpg"),
                      radius: 30.r,
                    ),
                    trailing: Icon(Icons.edit, color: Colors.white),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading:
                        Icon(Icons.add_circle_outline, color: Colors.white),
                    title: Text(
                      "Add Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            buildListTile(
              title: "My Profile",
              icon: CupertinoIcons.person_crop_circle,
              onTap: () {
                context.pushNamed(AppRoutes.profileScreen.name);
              },
            ),
            buildListTile(
              title: "Subscription group",
              icon: Icons.group,
              onTap: () {
                context.pushNamed(AppRoutes.subscriptionGroupScreen.name);
              },
            ),
            buildListTile(
              title: "Invite Friends",
              icon: Icons.person_add_alt_1_outlined,
              onTap: () {
                context.pushNamed(AppRoutes.inviteScreen.name);
              },
            ),
            buildListTile(
              title: "Notification",
              icon: Icons.notifications_active_outlined,
              onTap: () {
                context.pushNamed(AppRoutes.notificationScreen.name);
              },
            ),
            buildListTile(
                title: "Support",
                icon: Icons.headset_mic_outlined,
                onTap: () {
                  context.pushNamed(AppRoutes.supportsScreen.name);
                }),
            buildListTile(title: "Logout", icon: Icons.logout, onTap: () {}),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(
      {required String title, required var icon, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18.h,
      ),
    );
  }
}
