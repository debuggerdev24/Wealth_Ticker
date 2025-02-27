import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/extension/my_extensions.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import '../../core/field_validator.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/global.dart';
import '../../core/widgets/auth_screen_text.dart';
import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';
import '../../provider/auth/auth_provider.dart';

TextEditingController _textFullName = TextEditingController();
TextEditingController _textEmail = TextEditingController();
TextEditingController _textPhone = TextEditingController();
TextEditingController _textReferralCode = TextEditingController();
TextEditingController _textPassword = TextEditingController();
TextEditingController _textConfirmPassword = TextEditingController();
TextEditingController _txtCountryCode = TextEditingController(text: "+91");
String countryCode = "+91";

GlobalKey<FormState> _formKey = GlobalKey();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    AuthProvider providerTrue =
        Provider.of<AuthProvider>(context, listen: true);
    AuthProvider providerFalse = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 5.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                AuthTitle(title: "Sign Up"),
                SizedBox(height: 5.h),
                AuthSlogan(text: "“Join now for live stock updates & chat!”"),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 22.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24.h,
                    children: [
                      MyTextField(
                        hintText: "Enter your fullname",
                        controller: _textFullName,
                        title: "Full Name",
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 13.h,
                          ),
                          child: SVGImages(
                              path: AppAssets.userIcon,
                              color: AppColors.authIconsColor),
                        ),
                        //Icon(CupertinoIcons.person),
                        validator: FieldValidators().required,
                      ),
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
                              color: AppColors.authIconsColor),
                        ),
                        validator: (value) {
                          return FieldValidators().multiCheck(
                            value,
                            [
                              FieldValidators().required,
                              FieldValidators().email,
                            ],
                          );
                        },
                      ),
                      MyTextField(
                        keyboardType: TextInputType.phone,
                        hintText: "(415) 892-5302",
                        controller: _textPhone,
                        title: "Mobile Number",
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 13.h,
                          ),
                          child: SVGImages(
                              path: AppAssets.phoneIcon,
                              color: AppColors.authIconsColor),
                        ),
                        //Icon(CupertinoIcons.phone),
                        suffix: myCountryCodePicker(
                            context, providerFalse, providerTrue),
                        validator: (value) {
                          myLog(msg: value!);
                          return FieldValidators().phoneNumber(
                            value,
                            providerTrue.phoneNumLength,
                          );
                        },
                      ),
                      MyTextField(
                        isOptional: true,
                        optionShowText: " (optional)",
                        title: "Referral Code",
                        hintText: "Enter your referral code",
                        controller: _textReferralCode,
                        suffix: referralFieldSuffix(),
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12.h,
                          ),
                          child: SVGImages(path: AppAssets.openLockIcon),
                        ), //Icon(Icons.lock_open_outlined),
                      ),
                      MyTextField(
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
                        obscureText: providerTrue.obSecureText,
                        suffix: IconButton(
                            onPressed: () {
                              providerFalse.changeVisibility();
                            },
                            icon: Icon(providerTrue.obSecureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                        validator: (value) {
                          return FieldValidators().multiCheck(
                            value,
                            [
                              FieldValidators().required,
                              FieldValidators().password,
                            ],
                          );
                        },
                      ),
                      MyTextField(
                        textInputAction: TextInputAction.done,
                        title: "Confirm password",
                        hintText: "Enter your confirm password",
                        controller: _textConfirmPassword,
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 14.h,
                          ),
                          child: SVGImages(
                            path: AppAssets.lockIcon,
                            color: AppColors.authIconsColor,
                          ),
                        ),
                        obscureText: true,
                        validator: FieldValidators().required,
                      ),
                    ],
                  ),
                ),
                25.h.verticalSpace,
                MySubmitButtonFilled(
                  title: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_textPassword.text.trim() ==
                          _textConfirmPassword.text.trim()) {
                        FocusScope.of(context).unfocus();
                        // providerFalse.signUp(
                        //     context: context,o
                        //     email: _textEmail.text.trim(),
                        //     password: _textPassword.text.trim(),
                        //     fullName: _textFullName.text.trim(),
                        //     phoneNumber: _textPhone.text.trim(),
                        //     referralCode: _textReferralCode.text.trim());
                        context.push(
                          //pushReplacementNamed
                          AppRoutes.onBoardingScreen.path,
                        );
                        // context.pushReplacementNamed(AppRoutes.userFlowScreen.name);
                      } else {
                        showToast("Password not matched !!");
                      }
                    }
                  },
                ),
                16.h.verticalSpace,
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoutes.signInScreen.name);
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp)
                            // GoogleFonts.openSans(
                            //     fontSize: 14.sp,
                            //     fontWeight: FontWeight.w400,
                            //     color: Colors.grey), //(0xFF2C2C2C)
                            ),
                        TextSpan(
                            text: "Login",
                            style: textStyleW700.copyWith(
                                fontSize: 15.sp,
                                color: AppColors.darkGreenColor)
                            // GoogleFonts.openSans(
                            //     fontSize: 15.sp,
                            //   fontWeight: FontWeight.bold,
                            //   color: greenColor,
                            // ),
                            ),
                      ],
                    ),
                  ),
                ),
                15.h.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// CountryCodePicker(
//   initialSelection: 'IN',
//   flagWidth: 25.5.w,
//   pickerStyle: PickerStyle.dialog,
//   searchDecoration: InputDecoration(
//     hintText: "Search country...",
//     hintStyle: TextStyle(fontSize: 13.sp),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide:
//           BorderSide(color: Colors.grey.shade300),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide:
//           BorderSide(color: greenColor, width: 1.5),
//     ),
//     contentPadding:
//         EdgeInsets.symmetric(horizontal: 12),
//     prefixIcon: Icon(CupertinoIcons.search),
//   ),
//   dialogSize: Size.fromHeight(500.h),
//   margin: EdgeInsets.symmetric(horizontal: 8.w),
//   padding: EdgeInsets.symmetric(horizontal: 2.w),
//   onChanged: (value) {
//     _textPhone.text = value.dialCode!;
//     myLog(msg: _textPhone.text);
//   },
// ),

Widget referralFieldSuffix() {
  return Container(
    width: 0,
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(2.w, 16.h, 14.w, 16.h),
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
        color: Colors.grey.shade700,
      ),
    ),
    child: Icon(
      size: 22.h,
      Icons.keyboard_arrow_right_rounded,
      color: Colors.grey.shade700,
    ),
  );
}
