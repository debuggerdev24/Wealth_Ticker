import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/core/widgets/my_textfield.dart';

TextEditingController _textPostTitle = TextEditingController();
TextEditingController _textShortDescription = TextEditingController();
TextEditingController _textStatus = TextEditingController();
TextEditingController _textLuckyDrawStatus = TextEditingController();
TextEditingController _textPostedOn = TextEditingController();
TextEditingController _textPurchasedOn = TextEditingController();

class EditPostScreen extends StatelessWidget {
  const EditPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Edit Post",
      body: Padding(
        padding: appPadding(),
        child: SingleChildScrollView(
          child: Column(
            spacing: 18.h,
            children: [
              SizedBox(),
              MyTextField(
                title: "Post Title",
                hintText: "\$TSLA",
                controller: _textPostTitle,
              ),
              MyTextField(
                title: "Short Description",
                hintText: "Tech Stocks on the Rise ",
                controller: _textShortDescription,
              ),
              MyTextField(
                title: "Status",
                hintText: "Paid",
                controller: _textStatus,
              ),
              MyTextField(
                title: "Posted On",
                hintText: "Feb 15, 2025",
                controller: _textPostedOn,
              ),
              MyTextField(
                title: "Lucky Draw Status",
                hintText: "Active",
                controller: _textLuckyDrawStatus,
              ),
              MyTextField(
                title: "Purchase On ",
                hintText: "\$6.05",
                controller: _textPurchasedOn,
              ),
              MySubmitButtonFilled(title: "Save", onPressed: () {}),
              20.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
