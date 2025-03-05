import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/my_text.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';

import '../../provider/auth/auth_provider.dart';
import '../theme/app_colors.dart';

EdgeInsets appPadding() {
  return EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 0.h);
}

Color greenColor = Color(0xff013024);

void showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16,
  );
}

Widget myCountryCodePicker(
  BuildContext context,
  ValueChanged<Country> onSelect,
  String countryFlag,
) {
  return GestureDetector(
    onTap: () {
      showCountryPicker(
        context: context,
        showPhoneCode: true,
        countryListTheme: CountryListThemeData(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
          ),
          inputDecoration: InputDecoration(
            hintText: "Search Country...",
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
            prefixIcon:
                Icon(CupertinoIcons.search, color: Colors.grey.shade700),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide(color: AppColors.darkGreenColor, width: 1.5),
            ),
          ),
        ),
        //todo customFlagBuilder: (country) {
        //todo },
        onSelect: (Country country) {
          log(country.phoneCode.toString());
          log(country.countryCode.toString());
          //I/flutter (21138): 91
          // I/flutter (21138): IN
          onSelect.call(country);
          // providerFalse.updateCountryPhoneCode(
          //   phoneCode: "+ ${country.phoneCode}",
          //   length: country.example.length,
          // );
        },
      );
    },
    child: countryPickBox(countryFlag),
  );
}

IntrinsicWidth countryPickBox(String countryFlag) {
  return IntrinsicWidth(
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(06.w, 1.5.h, 01.5.w, 1.5.h),
      margin: EdgeInsets.fromLTRB(0.w, 11.h, 14.w, 11.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xff737373),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.network("https://flagcdn.com/w320/$countryFlag.png",height: 12.h),
          Text(
            countryFlag,
            style: TextStyle(fontSize: 20.sp),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color(0xff737373),
          )
        ],
      ),
    ),
  );
}

Widget topUserTile(
    {required BuildContext context, required userName, required image,required String iconPath}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: MyText(
      data: userName,
      style: textStyleW700.copyWith(
          color: AppColors.darkGreenColor, fontSize: 20.sp),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            context.push(AppRoutes.profileScreen.path);
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 19.r,
          ),
        ),
        10.w.horizontalSpace,
        SVGImages(
          height: 36.8.h,
          path: iconPath,
        )
        // Container(
        //   padding: EdgeInsets.all(6.r),
        //   decoration: BoxDecoration(
        //     shape: BoxShape.circle,
        //     border: Border.all(
        //       color: Colors.black,
        //     ),
        //   ),
        //   child: Icon(CupertinoIcons.bell),
        // )
      ],
    ),
  );
}
