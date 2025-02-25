import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/model/post_model.dart';

class PostDetailsScreen extends StatelessWidget {
  final PurchasedPostModel post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAppLayOut(
        title: "Market Update",
        body: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 5.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.h.verticalSpace,
                Container(
                  height: 220.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(1, 4),
                        blurRadius: 10,
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(post.image),
                    ),
                  ),
                ),
                16.h.verticalSpace,
                _detailsWidget(
                    date: post.publishedDate, title: "Published Date"),
                _detailsWidget(
                    date: post.purchasedDate, title: "Purchase Date"),
                10.h.verticalSpace,
                _postDetailsTitle("Full Analysis :"),
                12.h.verticalSpace,
                Text(
                  post.fullDes,
                  style: TextStyle(fontSize: 14.sp, color: Color(0xff5c5c5c)),
                ),
                20.h.verticalSpace,
                _postDetailsTitle("Key Takeaways :"),
                12.h.verticalSpace,
                _detailsWidget(date: post.revenueGrowth, title: "Revenue growth"),
                _detailsWidget(
                    date: "15.3% (industry average: 8%).",
                    title: "Net profit margin"),
                _detailsWidget(
                    date: "Increased market share in EV sector.",
                    title: "Revenue growth"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding _detailsWidget({required String date, required String title}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 9.h),
    child: Row(
      children: [
        Text(
          title,
          style: textStyleW600.copyWith(
            fontSize: 14.sp,
          ),
        ),
        Text("   :  "),
        Expanded(child: Text(date))
      ],
    ),
  );
}

Text _postDetailsTitle(title) {
  return Text(
    title,
    style: textStyleW600.copyWith(fontSize: 18.sp, color: greenColor),
  );
}
