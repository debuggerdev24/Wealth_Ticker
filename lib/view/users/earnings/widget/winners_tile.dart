import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/model/user/earning_model.dart';

import '../../../../core/text_styls.dart';
import '../../../../model/admin/lucky_draw_model.dart';

class WinnersTile extends StatelessWidget {
  final PastWinnersModel winner;

  const WinnersTile({super.key, required this.winner});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Color(0xffbfbfbf),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(1, 5),
            blurRadius: 5,
          ),
        ],
        color: AppColors.lightCreamColor, //AppColors.lightCreamColor,
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=HKS~R55VEfvHbJKKuosHG2qgDYxpC9RmrWaFpiVszXb7lLf1SCnAN0D6mcC-BXFSZDrk3BdwaVzVgEYHeZAAitN7ak-Ex3-yr9wjDvX8dNiuqj7GHUPJyVHpWSooSmQsLv4NYJ9ZAt5tnIMyCyEIo6rImMv~9XCpoKzHKIHwCbn0mD7UsQccJCqGCi0lqVGOZFcGD36sa2aJCgssppFDjKZoEulhfU~T4HPM4LDd8QWB~9msFATx1f9VqfcIFJYYDwlBte~XbCqIk87LV9pn-NLVx50R2ods4E~zzd3GFag4wnMFvuFslTWxndNpfZnhI58eZgWIiydih0zlYK6D-A__"),
        ),
        title: Text(winner.name),
        subtitle: Text(winner.date),
        trailing: Text(
          winner.price,
          style: textStyleW700.copyWith(
            fontSize: 16.sp,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
