import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/provider/admin/pay_out_provider.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/widgets/pay_out_user.dart';

class PayoutListScreen extends StatelessWidget {
  const PayoutListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PayOutProvider providerTrue =
        Provider.of<PayOutProvider>(context, listen: true);
    PayOutProvider provider = Provider.of<PayOutProvider>(context);
    return MyAppLayOut(
      title: "Payout List",
      body: Padding(
        padding: appPadding(),
        child: Column(
          children: [
            18.h.verticalSpace,
            Column(
              spacing: 18.h,
              children: List.generate(
                providerTrue.payoutList.length,
                (index) {
                  final user = providerTrue.payoutList[index];
                  return user.status
                      ? PayOutUserPending(user: user)
                      : PayOutUserPending(user: user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
