import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/global.dart';
import '../../../core/widgets/my_button.dart';
import '../../../core/widgets/my_textfield.dart';
import '../../../provider/auth/auth_provider.dart';

TextEditingController _textFullName = TextEditingController();
TextEditingController _textEmail = TextEditingController();
TextEditingController _textMobileNumber = TextEditingController();
TextEditingController _textPassword = TextEditingController();

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthProvider providerTrue =
    // Provider.of<AuthProvider>(context, listen: true);
    // AuthProvider providerFalse = Provider.of<AuthProvider>(context);
    return Scaffold(
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
        leading: Padding(
          padding: EdgeInsets.all(18.r),
          child: SVGImages(
            path: AppAssets.editIcon,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w,5.h,20.h,0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.h.verticalSpace,
                //todo profile image ui
                Stack(
                  children: [
                    Container(
                      height: 105.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: ClipOval(
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          placeholder:
                              AssetImage("assets/images/auth_screen/on_b2.png"),
                          image: NetworkImage(
                              "https://s3-alpha-sig.figma.com/img/631a/e9d1/8913573857117663f71ac91bd6180688?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=IXXFUJ-l84XxqJgy95pyOjsqAoNEGChTWDNwJlanDN3I4RxlQSJIfnNBWEwb4kGHfYOHGut188SUsG~9uTEJUyrAZtez9Akyhw3xVNDfOuSAC7FcYETVPUyou2I-azHDH5RpOjDVB3slFVNUnfUojhUbbtg6Ib8q1DSX0M-UcqqvzbM~hid784~ImURB~M9jeKT5GYtS~wImwpSkrOCinhb4Xt-bj4GK5sgF~cw5ZevEcybSEsPZkJMWzGk5Rgt-P3gpJU9nn6flASOOI2gsuSYK4qq46Qy8s1crEGQltBPbT-sFfme-dP8ZY6pd0Vj8M02Vd3AHpn7~ZBIzlZbktA__"),
                          fadeInDuration: Duration(seconds: 1),
                          fadeOutDuration: Duration(milliseconds: 200),
                        ),
                      ),
                    ),
                    //todo --------------------------> button to pick image
                    Positioned(
                      bottom: -9,
                      right: -28,
                      child: MaterialButton(
                        height: 24.h,
                        padding: EdgeInsets.all(2),
                        elevation: 1,
                        onPressed: () async {},
                        color: AppColors.darkGreenColor,
                        shape: const CircleBorder(),
                        child: Icon(
                          Icons.photo_camera_outlined,
                          size: 12.h,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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
                        child: SVGImages(path: AppAssets.userIcon),
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
                        child: SVGImages(path: AppAssets.mailIcon,color: AppColors.authIconsColor),
                      ),
                    ),
                    MyTextField(
                      title: "Mobile Number",
                      hintText: "ethancarter@gmail.com",
                      controller: _textMobileNumber,
                      prefix: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 13.h,
                        ),
                        child: SVGImages(path: AppAssets.phoneIcon,color: AppColors.authIconsColor),
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
                      onTap: () {},
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
                22.h.verticalSpace,
                MySubmitButtonFilled(
                  title: "Save",
                  onPressed: () {},
                ),
                16.h.verticalSpace,
              ],
            ),
          ),
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
