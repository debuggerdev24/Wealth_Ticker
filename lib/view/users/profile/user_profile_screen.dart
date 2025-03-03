import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/provider/user/user_profile_provider.dart';
import 'package:wealth_ticker_main/provider/user/user_profile_provider.dart';
import 'package:wealth_ticker_main/provider/user/user_profile_provider.dart';
import 'package:wealth_ticker_main/provider/user/user_profile_provider.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/my_textfield.dart';

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
        index.value = 0;
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.darkGreenColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: Icon(Icons.bookmark_outline_rounded),
            ),
          ],
          title: Text(
            "My Profile",
            style: textStyleW700.copyWith(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
          // leading: Padding(
          //   padding: EdgeInsets.all(18.r),
          //   child: SVGImages(
          //     path: AppAssets.editIcon,
          //   ),
          // ),
        ),
        body: Center(
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
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          child: ClipOval(
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: AssetImage(
                                  "assets/images/auth_screen/on_b2.png"),
                              image: FileImage(providerTrue.fileImage!),
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
                      ),
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
                      ),
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
                          (country) {
                            provider.updateCountryPhoneCode(
                              phoneCode: "+ ${country.phoneCode}",
                              length: country.example.length,
                            );
                          },
                          providerTrue.countryPhoneCode,
                        ),
                        // suffix: myCountryCodePicker(context, (country) {
                        //   providerFalse.updateCountryPhoneCode(
                        //     phoneCode: "+ ${country.phoneCode}",
                        //     length: country.example.length,
                        //   );
                        // }, providerTrue.),
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
                      ),
                    ],
                  ),
                  14.h.verticalSpace,
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
                      customTile(
                        SVGImages(
                          path: AppAssets.logOutIcon,
                          color: Color(0xff333333),
                        ),
                        "Log out",
                        onTap: () {
                          context.goNamed(AppRoutes.signUpScreen.name);
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.deleteBucket,
                            colorFilter: const ColorFilter.mode(
                                Colors.red, BlendMode.srcIn),
                          ),
                          14.w.horizontalSpace,
                          Text(
                            "Delete Account",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        ],
                      )
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
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 18, left: 18),
                child: Text(
                  "Profile Photo",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                await getCameraImage();
                if (xFile != null) {
                  provider.uploadProfileImage(
                    xFile!.path
                  );
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
                await getGalleryImage();
                if (xFile != null) {
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

  Future<void> getCameraImage() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // imageQuality: 40,
    );
  }

  Future<void> getGalleryImage() async {
    xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      // imageQuality: 40,
    );
  }

  Widget customTile(Widget icon, String title, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(icon, color: icon == CupertinoIcons.delete ? Colors.red : null),
          icon,
          14.w.horizontalSpace,
          Text(
            title,
            style: TextStyle(
                // color: icon == CupertinoIcons.delete ? Colors.red : null,
                ),
          ),
        ],
      ),
    );
  }
}
