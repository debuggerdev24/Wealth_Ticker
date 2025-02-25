import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/routes.dart';
import '../../core/widgets/auth_screen_text.dart';
import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';

TextEditingController textEmail = TextEditingController();

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              AuthTitle(title: "Forgot Password"),
              SizedBox(height: 6.h),
              AuthSlogan(text: "“No worries! Reset your password here.”"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: MyTextField(
                  title: "Email",
                  hintText: "Enter your email",
                  controller: textEmail,
                  prefix: Icon(CupertinoIcons.mail),
                ),
              ),
              MySubmitButtonFilled(
                title: "Send",
                onPressed: () {
                  context.pushNamed(AppRoutes.otpScreen.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}