import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';

class ConfirmWinner extends StatelessWidget {
  const ConfirmWinner({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: " Lucky Draw Winner Selected",
      body: Padding(
        padding: appPadding(),
        child: Column(
          children: [
            28.h.verticalSpace,
            Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 21.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(0, 5),
                    blurRadius: 5,
                  ),
                ],
                color: AppColors.lightCreamColor,
                border: Border.all(color: Color(0xffbdbdbd)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 16.h,
                    ),
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://s3-alpha-sig.figma.com/img/054c/786b/8d929ba332f2bed6ef20981d72b96fad?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=fI6jLu0YMICTnodFu6wZJ8A3IBRBLda1w5gF5P6sMUFaM5X5HdkLoYHatl7MtaybxqwyFziG6-j0mnWEixy6ih6w56~gBlzNJF5rp1LWDRSGUGqTPK1PD0~LVP9AZwfIA1-vJ-s3Lt1CkPfOxf7fO8DgRQztaLZ9qhqAfLE8WZz~Hsrv4uFvrMxFAwyG~~9oSQEmZ9PYPDVicXvU8NRZ4KWUcJ2FtrcdrAfjfK1qZpKGQ3n~xIl8PEj0TL~4pGdFzfVs38ZyIA51-SI1xlK0RiYI0ksr1fo1OeoWpvnpl~a3nfNKQHiD0xc6Vm7YKDEQpLv8YICfL0F2UhAmYpvjrw__"),
                      ),
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '"Are you sure you want to select ',
                          style: textStyleW400.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Zoe Martin",
                          style: textStyleW700.copyWith(
                              fontSize: 18.sp, color: Colors.black),
                        ),
                        TextSpan(
                          text:
                              ' as the lucky draw winner? This action cannot be undone."',
                          style: textStyleW400.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            MySubmitButtonOutlined(
              title: "Cancel",
              onPressed: () {
                context.pop();
              },
            ),
            14.h.verticalSpace,
            MySubmitButtonFilled(
              title: "Confirm Winner",
              onPressed: () {
                context.push(AppRoutes.winnerSelected.path);
              },
            ),
            20.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
