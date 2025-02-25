import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../../core/utils/global.dart';
import '../../../core/widgets/my_app_layout.dart';
import '../../../provider/notification_provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationProvider provider = Provider.of<NotificationProvider>(context);
    NotificationProvider providerTrue =
        Provider.of<NotificationProvider>(context, listen: true);

    return MyAppLayOut(
      title: "Notifications",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 24.h, 12.w, 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...provider.switches.keys.map(
              (title) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(title),
                  trailing: CupertinoSwitch(
                    value: provider.switches[title]!,
                    onChanged: (value) {
                      provider.toggleSwitch(title);
                    },
                    activeTrackColor: greenColor,
                  ),
                );
              },
            ),
            SizedBox(height: 26.h),
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(0, 5),
                        blurRadius: 5),
                  ],
                  color: Color(0xffededed),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Admin: ",
                          style: textStyleW700.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text:
                              '"📊 Stock Update: AAPL dropped, key support at 170."',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "10 m ago",
                      style: TextStyle(
                        color: greenColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 13.w),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(0, 5),
                        blurRadius: 5),
                  ],
                  color: Color(0xffededed),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Admin: ",
                          style: textStyleW700.copyWith(
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text: '"🔔 Reminder : Market opens in 30 minutes!" ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "1 h ago",
                      style: TextStyle(
                        color: greenColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
