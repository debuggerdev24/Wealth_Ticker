import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/field_validator.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/provider/auth/auth_provider.dart';
import 'package:wealth_ticker_main/view/auth/sign_up_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/widget/error_widget.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/global.dart';
import '../../core/widgets/auth_screen_text.dart';
import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';
import '../../core/widgets/svg_images.dart';

TextEditingController _textEmail = TextEditingController();
TextEditingController _textReferrelCode = TextEditingController();
TextEditingController _textPassword = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider providerTrue =
        Provider.of<AuthProvider>(context, listen: true);
    AuthProvider provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 0.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.h.verticalSpace,
                AuthTitle(title: "Sign In"),
                5.h.verticalSpace,
                AuthSlogan(text: "“Welcome back! Stay ahead in the market.”"),
                10.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(top: 22.h),
                  child: Column(
                    spacing: 24.h,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          MyTextField(
                            hintText: "Enter your email",
                            controller: _textEmail,
                            title: "Email",
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 13.h,
                              ),
                              child: SVGImages(
                                path: AppAssets.mailIcon,
                                color: AppColors.authIconsColor,
                              ),
                            ),
                            validator: (value) {
                              String error = FieldValidators().multiCheck(
                                    value,
                                    [
                                      (value) => FieldValidators()
                                          .required(value, "Email"),
                                      FieldValidators().email,
                                    ],
                                  ) ??
                                  "";
                              provider.updateValidationStatusForSignIn(
                                field: "email",
                                error: error,
                              );
                              return null;
                            },
                          ),
                          providerTrue.signInEmailError.isEmpty
                              ? SizedBox()
                              : CustomErrorWidget(
                                  errorMessage: providerTrue.signInEmailError,
                                  paddingLeft: 15.w,
                                ),
                        ],
                      ),
                      MyTextField(
                        isOptional: true,
                        optionShowText: " (optional)",
                        title: "Referral Code",
                        hintText: "Enter your referral code",
                        controller: _textReferrelCode,
                        suffix: GestureDetector(
                          onTap: () {},
                          child: referralFieldSuffix(),
                        ),
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                          ),
                          child: SVGImages(
                            path: AppAssets.openLockIcon,
                            color: AppColors.authIconsColor,
                          ),
                        ), //Icon(Icons.lock_open_outlined),
                      ),
                      Column(
                        children: [
                          MyTextField(
                            textInputAction: TextInputAction.done,
                            title: "Password",
                            hintText: "Enter your password",
                            controller: _textPassword,
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 14.h,
                              ),
                              child: SVGImages(
                                path: AppAssets.lockIcon,
                                color: AppColors.authIconsColor,
                              ),
                            ),
                            validator: (value) {
                              String error = FieldValidators().multiCheck(
                                    value,
                                    [
                                      (value) => FieldValidators()
                                          .required(value, "Password"),
                                      FieldValidators().password,
                                    ],
                                  ) ??
                                  "";
                              provider.updateValidationStatusForSignIn(
                                field: "password",
                                error: error,
                              );
                              return null;
                            },
                          ),
                          providerTrue.signInPasswordError.isEmpty
                              ? SizedBox()
                              : CustomErrorWidget(
                                  errorMessage:
                                      providerTrue.signInPasswordError,
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                5.h.verticalSpace,
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoutes.forgotPasswordScreen.name);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                40.h.verticalSpace,
                MySubmitButtonFilled(
                  title: "Sign In",
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        providerTrue.signInEmailError.isEmpty &&
                        providerTrue.signInPasswordError.isEmpty) {
                      context.pushNamed(AppRoutes.errorMsgScreen.name);
                    }
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
                            color: AppColors.darkGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                38.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 14.w,
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
                15.h.verticalSpace,
              ],
            ),
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
        border: Border.all(color: AppColors.darkGreenColor, width: 1.w),
      ),
      child: SVGImages(path: iconPath),
      //todo SvgPicture.asset(iconPath),
    );
  }
}
