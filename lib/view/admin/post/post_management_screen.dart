import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/provider/admin/post_provider.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import '../../../core/theme/app_colors.dart';

class PostManagementScreen extends StatelessWidget {
  const PostManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PostProvider provider = Provider.of<PostProvider>(context, listen: true);
    PostProvider providerTrue = Provider.of<PostProvider>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        indexTabAdmin.value = 0;
        return;
      },
      child: MyAppLayOut(
        showBackButton: false,
        title: "Post Management",
        // leading: Padding(
        //   padding: EdgeInsets.all(19.r),
        //   child: SVGImages(
        //     path: AppAssets.editIcon,
        //   ),
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 9.w,
            ),
            child: SVGImages(path: AppAssets.deleteBucket),
          ),
        ],
        body: Padding(
          padding: appPadding(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 18.h,
              children: [
                SizedBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Market Updates:",
                      style: textStyleW600.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.darkGreenColor,
                      ),
                    ),
                    SVGImages(path: AppAssets.plusFileIcon)
                  ],
                ),
                ...List.generate(
                  providerTrue.postList.length,
                  (index) {
                    final post = providerTrue.postList[index];
                    return GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.editPostScreen.path);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 16.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xffbfbfbf)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(1, 5),
                              blurRadius: 2.5,
                            ),
                          ],
                          color: AppColors.lightCreamColor,
                        ),
                        child: Column(
                          children: [
                            _detailsRow("Post Title", post.postTitle, true),
                            _detailsRow(
                              "Short Description",
                              post.shortDes,
                            ),
                            _detailsRow(
                              "Status",
                              post.status,
                            ),
                            _detailsRow(
                              "Posted On",
                              post.postedOn,
                            ),
                            _detailsRow(
                              "Lucky Draw Status",
                              post.luckyDrawStatus,
                            ),
                            _detailsRow(
                              "Purchase On ",
                              post.purchaseOn,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailsRow([
    String? title,
    String? value,
    bool isTitle = false,
  ]) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title!,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          Text(
            "  :  ",
            style: TextStyle(fontSize: 16.sp),
          ),
          Expanded(
            child: Text(
              value!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: isTitle ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
