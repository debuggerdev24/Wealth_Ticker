import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/global.dart';
import '../../core/widgets/auth_screen_text.dart';
import '../../core/widgets/my_button.dart';

TextEditingController textEmail = TextEditingController();

TextEditingController otpController = TextEditingController();

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              AuthTitle(title: "Enter 4 Digit Code"),
              SizedBox(height: 5.h),
              AuthSlogan(text: "“Enter the code sent to your email.”"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 34.h),
                child: Pinput(
                  controller: otpController,
                  length: 4,
                  defaultPinTheme: PinTheme(
                    height: 55.h,
                    width: 55.w,
                    textStyle: textStyleW700.copyWith(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    height: 55.h,
                    width: 55.w,
                    textStyle: textStyleW700.copyWith(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r), // Less Radius
                      border: Border.all(color: AppColors.darkGreenColor, width: 2),
                    ),
                  ),
                  submittedPinTheme: PinTheme(
                    height: 55.h,
                    width: 55.w,
                    textStyle: textStyleW700.copyWith(
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onCompleted: (code) {},
                ),
              ),
              MySubmitButtonFilled(
                title: "Verify",
                onPressed: () {
                  context.pushNamed(AppRoutes.onBoardingScreen.name);
                },
              ),
              SizedBox(height: 12.h),
              AuthSlogan(text: "Resend OTP"),
            ],
          ),
        ),
      ),
    );
  }
}
