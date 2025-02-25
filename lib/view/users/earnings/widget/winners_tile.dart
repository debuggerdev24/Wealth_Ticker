import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/model/earning_model.dart';

import '../../../../core/text_styls.dart';

class WinnersTile extends StatelessWidget {
  final PastWinnersModel winner;
  const WinnersTile({super.key,required this.winner});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffbfbfbf)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(1, 5),
            blurRadius: 5,
          ),
        ],
        color: Color(0xffededed),
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YLyDK6mXohxlYIYwdjDdSz3i2-tbp8uerjg1cbFO2nt2dqfCizKju9zpYCMdvBF26AqkSCXoGyZzRiVRIWcqOMKm6tGaJ93gKPxYAzr1gTbIqkg1VWZIyu1muQXbmWOtdJKQ7k0-vYKucKKKwLQjPSDeZAzX4Qbgz0IfeePByRmt25j-OYSQvRulR3L6WCTy2spC5lEEGKAa3-CW2WYvLY2rVf3hlYWGTbEYs2kVH0n72tHbbZOV~t2xM2XVE0qQBg8NuzCUtSLnPDhnH~-KP2xqEXewizI4w0U9UDRX2Cj1SVSiWtKI7XJcEKv7NiImsvodTVjAr~0F81Vhn1DhUg__"),
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
