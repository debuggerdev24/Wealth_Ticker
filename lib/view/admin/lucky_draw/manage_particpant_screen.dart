import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/provider/admin/lucky_draw_provider.dart';
import 'package:wealth_ticker_main/view/admin/lucky_draw/widgets/participent_user_tile.dart';


class ManageParticipantScreen extends StatelessWidget {
  const ManageParticipantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LuckyDrawProvider _providerTrue =
    Provider.of<LuckyDrawProvider>(context, listen: true);
    LuckyDrawProvider _provider = Provider.of<LuckyDrawProvider>(context);
    return MyAppLayOut(
      title: "Manage Participants",
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: SVGImages(iconPath: AppAssets.userCrossDelete),
        )
      ],
      body: Padding(
        padding: appPadding(),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12.h,
            children: [
              16.h.verticalSpace,
              ...List.generate(
                10,
                    (index) {
                  final user = _provider.participantUsersList[
                  index % _provider.participantUsersList.length];
                  return GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.confirmWinner.path);
                    },
                    child: ParticipantUserTile(
                        image: user.image,
                        title: user.title,
                        numOfPurchasedPost: user.numOfPurchasedPost,
                        customerName: user.customerName),
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
