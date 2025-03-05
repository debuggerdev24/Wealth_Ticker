import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/extension/my_extensions.dart';
import 'package:wealth_ticker_main/core/field_validator.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/provider/user/user_profile_provider.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/widget/error_widget.dart';
import 'package:wealth_ticker_main/view/users/user_dashboard_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/my_textfield.dart';

GlobalKey<FormState> _formKey = GlobalKey();
XFile? xFile;
TextEditingController _textFullName = TextEditingController();
TextEditingController _textEmail = TextEditingController();
TextEditingController _textMobileNumber = TextEditingController();
TextEditingController _textPassword = TextEditingController();

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProfileProvider providerTrue =
        Provider.of<UserProfileProvider>(context, listen: true);
    UserProfileProvider provider = Provider.of<UserProfileProvider>(context);
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        indexTabUser.value = 0;
        return;
      },
      child: MyAppLayOut(
        showBackButton: false,
        leading: SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showToast("Profile Saved Successfully");
              }
            },
            color: Colors.white,
            icon: Icon(Icons.bookmark_outline_rounded),
          ),
        ],
        title: "My Profile",
        body: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 5.h, 20.h, 0.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    20.h.verticalSpace,
                    //todo profile image ui
                    GestureDetector(
                      onTap: () {
                        openImagePickOptions(context, providerTrue, provider);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 105.h,
                            width: 105.w,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: Offset(0, 1.5),
                                  blurRadius: 5)
                            ], shape: BoxShape.circle, color: Colors.grey),
                            child: ClipOval(
                              child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder: AssetImage(
                                  "assets/images/auth_screen/on_b2.png",
                                ),
                                image: providerTrue.fileImage != null
                                    ? FileImage(providerTrue.fileImage!)
                                    : AssetImage(AppAssets.userProfileIcon),
                                fadeInDuration: Duration(seconds: 1),
                                fadeOutDuration: Duration(milliseconds: 200),
                              ),
                            ),
                          ),
                          //todo --------------------------> button to pick image
                          Positioned(
                            bottom: 0.9, // Adjust position
                            right: 0.9, // Adjust position
                            child: SVGImages(path: AppAssets.addOutlinedIcon),
                            // Icon(
                            //   Icons.add_circle_outline_rounded,
                            //   size: 35.sp,
                            //   color: AppColors.greyColor,
                            // ),
                          ),
                          // Positioned(
                          //   bottom: -9,
                          //   right: -28,
                          //   child: MaterialButton(
                          //     height: 24.h,
                          //     padding: EdgeInsets.all(2),
                          //     elevation: 1,
                          //     onPressed: () async {},
                          //     color: AppColors.darkGreenColor,
                          //     shape: const CircleBorder(),
                          //     child: Icon(
                          //       Icons.photo_camera_outlined,
                          //       size: 12.h,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    //todo name
                    8.h.verticalSpace,
                    Text(
                      "Ethan Carter",
                      style: textStyleW500.copyWith(
                          color: Colors.black, fontSize: 18.sp),
                    ),
                    28.h.verticalSpace,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 21.h,
                      children: [
                        Column(
                          children: [
                            MyTextField(
                              title: "Full Name",
                              hintText: "Ethan Carter",
                              controller: _textFullName,
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
                                String error =
                                    FieldValidators().fullName(value!, false) ??
                                        "";
                                provider.updateValidationStatus(
                                    field: "fullName", error: error);
                                return null;
                              },
                            ),
                            providerTrue.fullNameError.isEmpty
                                ? SizedBox()
                                : CustomErrorWidget(
                                    errorMessage: providerTrue.fullNameError),
                          ],
                        ),
                        Column(
                          children: [
                            MyTextField(
                              title: "Email",
                              hintText: "ethancarter@gmail.com",
                              controller: _textEmail,
                              prefix: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 13.h,
                                ),
                                child: SVGImages(
                                    path: AppAssets.mailIcon,
                                    color: AppColors.authIconsColor),
                              ),
                              validator: (value) {
                                String error =
                                    FieldValidators().email(value, false) ?? "";
                                provider.updateValidationStatus(
                                  field: "email",
                                  error: error,
                                );
                                return null;
                              },
                            ),
                            providerTrue.emailError.isEmpty
                                ? SizedBox()
                                : CustomErrorWidget(
                                    errorMessage: providerTrue.emailError,
                                  ),
                          ],
                        ),
                        Column(
                          children: [
                            MyTextField(
                              title: "Mobile Number",
                              hintText: "(415) 892-5302",
                              controller: _textMobileNumber,
                              prefix: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 13.h,
                                ),
                                child: SVGImages(
                                    path: AppAssets.phoneIcon,
                                    color: AppColors.authIconsColor),
                              ),
                              suffix: myCountryCodePicker(
                                context,
                                provider.updateCountry,
                                providerTrue.country.flagEmoji,
                              ),
                              validator: (value) {
                                String error = FieldValidators().phoneNumber(value!,
                                        providerTrue.phoneNumLen, false) ??
                                    "";
                                provider.updateValidationStatus(
                                    field: "mobileNumber", error: error);
                                return null;
                              },
                              // suffix: myCountryCodePicker(context, (country) {
                              //   providerFalse.updateCountryPhoneCode(
                              //     phoneCode: "+ ${country.phoneCode}",
                              //     length: country.example.length,
                              //   );
                              // }, providerTrue.),
                            ),
                            providerTrue.mobileNumberError.isEmpty
                                ? SizedBox()
                                : CustomErrorWidget(
                              errorMessage: providerTrue.mobileNumberError,
                            ),
                          ],
                        ),
                        MyTextField(
                          readOnly: true,
                          obscureText: true,
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
                        ),
                      ],
                    ),
                    14.h.verticalSpace,
                    //todo --------------> Referral Code
                    Align(
                      alignment: Alignment.centerLeft,
                      child: customTile(
                        SVGImages(
                          path: AppAssets.refCodeProfileIcon,
                          color: Color(0xff333333),
                        ),
                        "Referral Code",
                        onTap: () {
                          context.push(AppRoutes.inviteScreen.path);
                        },
                      ),
                    ),
                    16.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //todo --------------> log out
                        customTile(
                          SVGImages(
                            path: AppAssets.logOutIcon,
                            color: Color(0xff333333),
                          ),
                          "Log out",
                          onTap: () {
                            myDialog(
                              context,
                              "Are you sure you want to Log Out?",
                              "Yes",
                              "Cancel",
                              () {
                                context.goNamed(AppRoutes.signUpScreen.name);
                              },
                              () {
                                context.pop();
                              },
                            );
                          },
                        ),
                        //todo --------------> delete account
                        customTile(
                          SvgPicture.asset(
                            AppAssets.deleteBucket,
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.srcIn),
                          ),
                          "Delete Account",
                          onTap: () {
                            myDialog(
                              context,
                              "Are you sure you want to Delete Account ?",
                              "Yes",
                              "Cancel",
                              () {
                                context.pop();
                              },
                              () {
                                context.pop();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    28.h.verticalSpace,
                    // MySubmitButtonFilled(
                    //   title: "Save",
                    //   onPressed: () {},
                    // ),
                    // 16.h.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> myDialog(
      BuildContext context,
      String dialogTitle,
      firstActionTitle,
      secondActionTitle,
      VoidCallback firstActionOnTap,
      VoidCallback secondActionOnTap) {
    return showDialog(
      context: context,
      builder: (context) {
        return ZoomIn(
          curve: Curves.fastOutSlowIn,
          duration: 300.ms,
          child: AlertDialog(
            title: Text(
              dialogTitle,
              style: textStyleW600.copyWith(
                fontSize: 18.sp,
                color: AppColors.darkGreenColor,
              ),
            ),
            actions: [
              myActionButtonTheme(firstActionOnTap, firstActionTitle),
              myActionButtonTheme(secondActionOnTap, secondActionTitle),
            ],
          ),
        );
        // .animate().scaleXY(
        //   begin: 0.4,
        //   end: 1,
        //   duration: 200.ms,
        //   curve: Curves.fastOutSlowIn,
        // );

        // .then(delay: 200.ms)
        // .scaleXY(begin: 1.5, end: 0.5, duration: 500.ms);
      },
    );
  }

  TextButton myActionButtonTheme(VoidCallback onPressed, String title) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.darkGreenColor,
        ),
      ),
    );
  }

  Widget customTile(Widget icon, String title, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          14.w.horizontalSpace,
          Text(
            title,
            style: TextStyle(
              color: title == "Delete Account" ? Colors.red : null,
            ),
          ),
        ],
      ),
    );
  }

  void openImagePickOptions(BuildContext context,
      UserProfileProvider providerTrue, UserProfileProvider provider) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 18.h, left: 18.w, bottom: 5.h),
                child: Text(
                  "Profile Photo",
                  style: textStyleW600.copyWith(
                      fontSize: 18.sp, color: AppColors.darkGreenColor),
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                xFile = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
                if (xFile != null && context.mounted) {
                  provider.updateProfileImage(xFile!.path);
                  Navigator.pop(context);
                }
              },
              leading: const Icon(Icons.photo_camera),
              title: const Text("Camera"),
            ),
            ListTile(
              enableFeedback: true,
              autofocus: true,
              onTap: () async {
                xFile = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                if (xFile != null && context.mounted) {
                  provider.updateProfileImage(xFile!.path);
                  context.pop(context);
                }
              },
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }
}
