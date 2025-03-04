import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/provider/admin/pay_out_provider.dart';
import 'package:wealth_ticker_main/view/admin/admin_dashboard_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/widgets/pay_out_user.dart';

class PayoutUsersListScreen extends StatelessWidget {
  const PayoutUsersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PayOutProvider providerTrue =
        Provider.of<PayOutProvider>(context, listen: true);
    PayOutProvider provider = Provider.of<PayOutProvider>(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        indexTabAdmin.value = 0;
        return;
      },
      child: MyAppLayOut(
        leadingWidth: 39.w,
        title: "Payout List",
        showBackButton: false,
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
                        ? PayOutUserProcessed(user: user)
                        : PayOutUserPending(user: user);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
