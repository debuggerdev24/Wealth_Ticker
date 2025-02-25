import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/model/post_model.dart';
import 'package:wealth_ticker_main/provider/user/post_provider.dart';

class PurchasedPost extends StatelessWidget {
  const PurchasedPost({super.key});

  @override
  Widget build(BuildContext context) {
    PurchasedPostProvider providerTrue =
        Provider.of<PurchasedPostProvider>(context, listen: true);
    PurchasedPostProvider provider =
        Provider.of<PurchasedPostProvider>(context, listen: false);
    return MyAppLayOut(
      showBackButton: false,
      title: "Purchased Post",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 5.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              20.h.verticalSpace,
              ...List.generate(
                providerTrue.purchasedPostList.length,
                (index) {
                  final post = providerTrue.purchasedPostList[index];
                  return PurchasedProductPostWidget(
                    post: post,
                    onTap: () {
                      context.pushNamed(AppRoutes.postDetailsScreen.name,
                          extra: post);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PurchasedProductPostWidget extends StatelessWidget {
  final VoidCallback onTap;
  final PurchasedPostModel post;

  const PurchasedProductPostWidget(
      {super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 22.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Color(0xfffafafa),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            Text(
              post.title,
              style: textStyleW600.copyWith(fontSize: 16.sp),
            ),
            16.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Short description"),
                Text(" : "),
                Expanded(
                  child: Text(post.shortDes),
                ),
              ],
            ),
            12.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Status"),
                Text(" : "),
                Expanded(
                  child: Text(post.status),
                ),
              ],
            ),
            12.h.verticalSpace,
            Row(
              children: [
                Text("Purchase Date"),
                Text(" : "),
                Text(post.purchasedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
