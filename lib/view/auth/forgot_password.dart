import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/field_validator.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/provider/auth/auth_provider.dart';
import 'package:wealth_ticker_main/view/users/earnings/widget/error_widget.dart';
import '../../core/routes/routes.dart';
import '../../core/widgets/auth_screen_text.dart';
import '../../core/widgets/my_button.dart';
import '../../core/widgets/my_textfield.dart';

TextEditingController _textEmail = TextEditingController();
GlobalKey<FormState> _formKey = GlobalKey();

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
          padding: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                50.h.verticalSpace,
                AuthTitle(title: "Forgot Password"),
                06.h.verticalSpace,
                AuthSlogan(text: "“No worries! Reset your password here.”"),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Column(
                    children: [
                      MyTextField(
                        textInputAction: TextInputAction.done,
                        title: "Email",
                        hintText: "Enter your Email",
                        controller: _textEmail,
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
                                  (val) =>
                                      FieldValidators().required(val, "Email"),
                                  FieldValidators().email,
                                ],
                              ) ??
                              "";
                          provider.updateValidationStatusForForgotPassword(
                              error: error);
                          return null;
                        },
                      ),
                      providerTrue.forgotPassEmailError.isEmpty
                          ? SizedBox()
                          : CustomErrorWidget(
                              errorMessage: providerTrue.forgotPassEmailError)
                    ],
                  ),
                ),
                MySubmitButtonFilled(
                  title: "Send",
                  onPressed: () {
                    // context.pushNamed(AppRoutes.otpScreen.name);
                    if (_formKey.currentState!.validate() &&
                        providerTrue.forgotPassEmailError.isEmpty) {
                      context.pushNamed(AppRoutes.otpScreen.name);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
