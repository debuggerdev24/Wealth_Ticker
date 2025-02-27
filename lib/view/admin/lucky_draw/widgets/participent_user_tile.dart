import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import '../../../../core/text_styls.dart';

class ParticipantUserTile extends StatelessWidget {
  final String image, title, customerName;
  final int numOfPurchasedPost;

  const ParticipantUserTile({
    super.key,
    required this.image,
    required this.title,
    required this.numOfPurchasedPost,
    required this.customerName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.dulGreen,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 1.5.h,
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 25.r,
          backgroundImage: NetworkImage(
            image,
            // "https://s3-alpha-sig.figma.com/img/312b/e8dc/8883945272046356095fc20da211d690?Expires=1741564800&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OAQPsjBnLQLR-p6uAFx7cfXSF90KngCmxLTnKOFoa3CeZEchX8ODAC68639sMPqMY~Iqmet3dqS6JxryMSwR0oCucUPjFN94oQNPqBFzTl9o7aCA7SwIzw4iagrpwrA7Rmjf~0sp-TUZL86ueShiq~9lIygeCi9ThgF39-0Zzko65gW~r8DfX1yiKjLB20Ud6lOCiJU1xFnXk7XiDRcrH4dxLrz4a5H4iIbpg6ML6hQe6ue83EnvjkYgt~3xYOtDdOBJflp6FgtNl9QKvAQ3uXp9kQI4ACuiU45ZmL1lwisv-x6PZguF2IqJtg7xf5SxLWH3mp8Frm3ew3Lger-ftg__"
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // "Stock Talk",
              title,
              style: textStyleW600,
            ),
            Text(
              "0$numOfPurchasedPost Posts purchased",
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.black
              ),
            ),
          ],
        ),
        subtitle: Text(
          "Customer Name : $customerName",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        //Chloe Young
        // trailing:
      ),
    );
  }
}
