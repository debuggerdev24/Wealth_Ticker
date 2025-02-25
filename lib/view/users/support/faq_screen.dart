import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';

import '../../../core/utils/global.dart';
import '../../../core/widgets/my_app_layout.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "FAQs",
      centerTitle: true,
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 5.h, 12.w, 5.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                iconColor: greenColor,
                title: Text(
                  "1. What is the stock market?",
                  style:
                      textStyleW700.copyWith(fontSize: 18.sp),
                ),
                tilePadding: EdgeInsets.zero,
                children: [
                  Text(
                      "The stock market is where investors buy and sell shares of publicly traded companies, allowing companies to raise capital and investors to trade ownership.")
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),

    );
  }
}
