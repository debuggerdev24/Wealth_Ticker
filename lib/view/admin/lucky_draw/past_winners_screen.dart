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
import 'package:wealth_ticker_main/provider/admin/lucky_draw_provider.dart';
import 'package:wealth_ticker_main/provider/admin/lucky_draw_provider.dart';
import 'package:wealth_ticker_main/provider/admin/lucky_draw_provider.dart';
import '../../../provider/user/earning_provider.dart';
import '../../users/earnings/widget/winners_tile.dart';

class PastWinnersScreenAdmin extends StatelessWidget {
  const PastWinnersScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    LuckyDrawProvider providerTrue =
        Provider.of<LuckyDrawProvider>(context, listen: true);
    LuckyDrawProvider provider =
        Provider.of<LuckyDrawProvider>(context, listen: false);
    return MyAppLayOut(
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
