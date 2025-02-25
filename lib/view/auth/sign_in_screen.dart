import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../core/routes/routes.dart';
import '../../core/utils/global.dart';
import '../../core/widgets/auth_screen_text.dart';
import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';
import '../../core/widgets/svg_images.dart';

TextEditingController _textEmail = TextEditingController();
TextEditingController _textReferrelCode = TextEditingController();
TextEditingController _textPassword = TextEditingController();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              AuthTitle(title: "Sign In"),
              SizedBox(height: 5.h),
              AuthSlogan(text: "“Welcome back! Stay ahead in the market.”"),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 22.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTextField(
                      hintText: "Enter your email",
                      controller: _textEmail,
                      title: "Email",
                      prefix: Icon(CupertinoIcons.mail),
                    ),
                    SizedBox(height: 24.h),
                    MyTextField(
                        isOptional: true,
                        optionShowText: " (optional)",
                        title: "Referral Code",
                        hintText: "Enter your referral code",
                        controller: _textReferrelCode,
                        prefix: Icon(Icons.lock_open_outlined)),
                    24.h.verticalSpace,
                    MyTextField(
                      title: "Password",
                      hintText: "Enter your password",
                      controller: _textPassword,
                      prefix: Icon(CupertinoIcons.lock),
                      textInputAction: TextInputAction.done,
                    ),
                    5.h.verticalSpace,
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context
                              .pushNamed(AppRoutes.forgotPasswordScreen.name);
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              18.h.verticalSpace,
              MySubmitButtonFilled(
                title: "Sign In",
                onPressed: () {
                  context.pushNamed(AppRoutes.errorMsgScreen.name);
                },
              ),
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.grey)
                          // GoogleFonts.openSans(
                          //     fontSize: 14.sp,
                          //     fontWeight: FontWeight.w400,
                          //     color: Colors.grey), //(0xFF2C2C2C)
                          ),
                      TextSpan(
                        text: "Sign Up",
                        style: textStyleW700.copyWith(
                          fontSize: 15.sp,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 38.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialIcons(
                      iconPath: AppAssets.googleLogo,
                      height: 57.h,
                      width: 57.w,
                    ),
                    SocialIcons(
                      iconPath: AppAssets.faceBookLogo,
                      height: 57.h,
                      width: 57.w,
                    ),
                    SocialIcons(
                      iconPath: AppAssets.appleLogo,
                      height: 57.h,
                      width: 57.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  final String iconPath;
  final double? height;
  final double? width;

  const SocialIcons(
      {super.key, required this.iconPath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: greenColor, width: 1.w),
      ),
      child: SVGImages(iconPath: iconPath),
      //todo SvgPicture.asset(iconPath),
    );
  }
}
