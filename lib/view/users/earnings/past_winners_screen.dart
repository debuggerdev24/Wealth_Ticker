import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/svg_images.dart';
import 'package:wealth_ticker_main/view/users/earnings/widget/winners_tile.dart';
import '../../../provider/user/earning_provider.dart';

class PastWinnersScreen extends StatelessWidget {
  const PastWinnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EarningsProvider providerTrue =
        Provider.of<EarningsProvider>(context, listen: true);
    EarningsProvider provider =
        Provider.of<EarningsProvider>(context, listen: false);
    return MyAppLayOut(
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: 10.w,
          ),
          child: GestureDetector(onTap: () {
            context.push(AppRoutes.bankDetailsScreen.path);
          },child: SVGImages(iconPath: AppAssets.bankEdit)),
        ),

        // IconButton(
        //   onPressed: () {
        //     context.pushNamed(AppRoutes.bankDetailsScreen.name);
        //   },
        //   icon: Icon(Icons.account_balance_outlined),
        // ),
      ],
      title: "Past Lucky Draw Winners",
      body: Padding(
        padding: appPadding(),
        child: ListView(children: [
          20.h.verticalSpace,
          ...List.generate(
            10,
            (index) {
              final winner = providerTrue
                  .pastWinners[index % providerTrue.pastWinners.length];
              return WinnersTile(winner: winner);
            },
          ),
        ]),
      ),
    );
  }
}
