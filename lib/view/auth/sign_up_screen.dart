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
import 'package:wealth_ticker_main/view/users/earnings/widget/error_widget.dart';
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
                SizedBox(
                  height: 50.h,
                ),
                AuthTitle(title: "Sign Up"),
                SizedBox(
                  height: 5.h,
                ),
                AuthSlogan(text: "“Join now for live stock updates & chat!”"),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 22.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 24.h,
                    children: [
                      //todo ---------------------------> full name
                      Column(
                        children: [
                          MyTextField(
                            hintText: "Enter your Full Name",
                            controller: _textFullName,
                            title: "Full Name",
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 13.h,
                              ),
                              child: SVGImages(
                                path: AppAssets.userIcon,
                                color: AppColors.authIconsColor,
                              ),
                            ),
                            validator: (value) {
                              String error = FieldValidators().multiCheck(
                                    value,
                                    [
                                      (value) =>
                                          FieldValidators()
                                              .required(value, "Full Name"),
                                      FieldValidators().fullName,
                                    ],
                                  ) ??
                                  "";
                              provider.updateValidationStatusForSignUp(
                                  field: "fullName", error: error);
                              return null;
                            },
                          ),
                          providerTrue.fullNameError.isNotEmpty
                              ? CustomErrorWidget(
                                  errorMessage: providerTrue.fullNameError,
                                )
                              : SizedBox(),
                        ],
                      ),
                      //todo ---------------------------> email
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
                                      (val) => FieldValidators()
                                          .required(val, "Email"),
                                      FieldValidators().email,
                                    ],
                                  ) ??
                                  "";
                              provider.updateValidationStatusForSignUp(
                                  field: "email", error: error);
                              return null;
                            },
                          ),
                          providerTrue.emailError.isEmpty
                              ? SizedBox()
                              : CustomErrorWidget(
                                  errorMessage: providerTrue.emailError,
                                  paddingLeft: 15.w,
                                ),
                        ],
                      ),
                      //todo ---------------------------> phone
                      Column(
                        children: [
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
                            suffix: myCountryCodePicker(context, (country) {
                              provider.updateCountryPhoneCode(
                                phoneCode: "+ ${country.phoneCode}",
                                length: country.example.length,
                              );
                            }, providerTrue.countryPhoneCode),
                            validator: (value) {
                              String error = FieldValidators().phoneNumber(
                                    value!,
                                    providerTrue.phoneNumLength,
                                  ) ??
                                  "";
                              provider.updateValidationStatusForSignUp(
                                  field: "mobileNumber", error: error);
                              return null;
                            },
                          ),
                          providerTrue.mobileNumberError.isEmpty
                              ? SizedBox()
                              : CustomErrorWidget(
                                  errorMessage: providerTrue.mobileNumberError,
                                ),
                        ],
                      ),
                      //todo ---------------------------> ref code
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
                          child: SVGImages(
                              path: AppAssets.openLockIcon,
                              color: AppColors.authIconsColor),
                        ), //Icon(Icons.lock_open_outlined),
                      ),
                      //todo ---------------------------> password
                      Column(
                        children: [
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
                                color: AppColors.authIconsColor,
                                onPressed: () {
                                  provider.changeVisibility();
                                },
                                icon: Icon(providerTrue.obSecureText
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined)),
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
                              provider.updateValidationStatusForSignUp(
                                field: "password",
                                error: error,
                              );
                              return null;
                            },
                          ),
                          providerTrue.passwordError.isEmpty
                              ? SizedBox()
                              : CustomErrorWidget(
                                  errorMessage: providerTrue.passwordError,
                                  paddingLeft: 15.w,
                                ),
                        ],
                      ),
                      //todo ---------------------------> confirm password
                      Column(
                        children: [
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
                            validator: (value) {
                              provider.updateValidationStatusForSignUp(
                                field: "confirmPassword",
                                error: FieldValidators()
                                        .required(value, "Confirm password") ??
                                    "",
                              );
                              return null;
                            },
                          ),
                          providerTrue.confirmPasswordError.isEmpty
                              ? SizedBox()
                              : CustomErrorWidget(
                                  errorMessage:
                                      providerTrue.confirmPasswordError,
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                25.h.verticalSpace,
                MySubmitButtonFilled(
                  title: "Sign Up",
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        providerTrue.fullNameError.isEmpty &&
                        providerTrue.emailError.isEmpty &&
                        providerTrue.mobileNumberError.isEmpty &&
                        providerTrue.passwordError.isEmpty &&
                        providerTrue.confirmPasswordError.isEmpty) {
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
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                            text: "Login",
                            style: textStyleW700.copyWith(
                              fontSize: 15.sp,
                              color: AppColors.darkGreenColor,
                            )),
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
    height: 16.h,
    margin: EdgeInsets.fromLTRB(5.w, 14.h, 14.w, 14.h),
    padding: EdgeInsets.only(bottom: 5.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
        color: Color(0xff737373),
      ),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Icon(
          size: 22.h,
          Icons.keyboard_arrow_right_rounded,
          color: Color(0xff737373),
        ),
      ],
    ),
  );
}
