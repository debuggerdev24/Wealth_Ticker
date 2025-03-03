import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/core/widgets/my_textfield.dart';

TextEditingController _textTotalPaidPost = TextEditingController();
TextEditingController _textPostPercentage = TextEditingController();
TextEditingController _textHowDrawWorks = TextEditingController();
TextEditingController _textDisclaimer = TextEditingController();

class LuckyDrawDetailsScreen extends StatelessWidget {
  const LuckyDrawDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      leadingWidth: 44.w,
      title: "Lucky Draw Details",
      body: Padding(
        padding: appPadding(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.h.verticalSpace,
              Text(
                "Draw Calculation",
                style: textStyleW600.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              14.h.verticalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 18.h,
                children: [
                  MyTextField(
                    title: "Total Paid Posts",
                    hintText: "Enter Your Total post Number",
                    controller: _textTotalPaidPost,
                  ),
                  MyTextField(
                    title: "Percentage Allocated to Draw",
                    hintText: "Enter Post Percentage ",
                    controller: _textPostPercentage,
                  ),
                  MyTextField(
                    maxLine: 3,
                    title: "How the Draw Works",
                    hintText: "Type Here...",
                    controller: _textHowDrawWorks,
                  ),
                  MyTextField(
                    maxLine: 3,
                    title: "Disclaimer :",
                    hintText: "Type Here...",
                    controller: _textDisclaimer,
                  ),
                ],
              ),
              75.h.verticalSpace,
              MySubmitButtonFilled(
                title: "Save",
                onPressed: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
