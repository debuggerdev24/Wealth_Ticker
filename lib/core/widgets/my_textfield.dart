import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import '../utils/global.dart';

class MyTextField extends StatelessWidget {
  final String title, hintText;
  final String? optionShowText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLine;
  final TextInputAction? textInputAction;
  final Widget? prefix,suffix;
  final bool? isOptional, obscureText, readOnly;
  final VoidCallback? onTap;

  MyTextField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.isOptional,
    this.maxLine = 1,
    this.validator,
    this.suffix,
    this.textInputAction,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap, this.optionShowText,
  }){
    if(isOptional == true) {
      assert(optionShowText != null);
    }
  }

        // assert(isOptional == true && optionShowText != null);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: textStyleW600.copyWith(
                    color: Colors.black, fontSize: 14.sp),
                // GoogleFonts.openSans(
                //     color: Colors.black,
                //     fontSize: 14.sp,
                //     fontWeight: FontWeight.w600),
              ),
              if (isOptional ?? false)
                TextSpan(
                  text: " $optionShowText",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
            ],
          ),
        ),
        11.h.verticalSpace,
        TextFormField(
          style: TextStyle(fontFamily: "Open Sans"),
          onTap: onTap,
          readOnly: readOnly!,
          obscureText: obscureText!,
          textInputAction: textInputAction ?? TextInputAction.next,
          keyboardType: keyboardType,
          validator: validator,
          cursorColor: AppColors.darkGreenColor,
          textAlignVertical: TextAlignVertical.center,
          maxLines: maxLine,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          expands: false,
          decoration: InputDecoration(
              errorStyle: TextStyle(height: 1.2),
              suffixIcon: suffix,
              prefixIcon: prefix,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 12.sp),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.r)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkGreenColor, width: 1.5))),
        ),
      ],
    );
  }
}
