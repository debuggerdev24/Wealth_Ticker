import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/core/widgets/my_textfield.dart';

TextEditingController _textUserName = TextEditingController();
TextEditingController _textBankDetails = TextEditingController();
TextEditingController _textPayoutAmount = TextEditingController();
TextEditingController _textPayoutMethod = TextEditingController();
TextEditingController _textRequestDate = TextEditingController();

class ProcessPayoutScreen extends StatelessWidget {
  const ProcessPayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppLayOut(
      title: "Process Payout",
      body: Padding(
        padding: appPadding(),
        child: Column(
          spacing: 18.h,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18.h),
              child: MyTextField(
                title: "Username",
                hintText: "AlexT",
                controller: _textUserName,
              ),
            ),
            MyTextField(
              title: "Bank Details",
              hintText: "****5678",
              controller: _textBankDetails,
            ),
            MyTextField(
              title: "Payout Amount",
              hintText: "\$1,500",
              controller: _textPayoutAmount,
            ),
            MyTextField(
              title: "Request Date",
              hintText: "Feb 20, 2025",
              controller: _textRequestDate,
            ),
            MyTextField(
              isOptional: true,
              optionShowText: "(Default)",
              title: "Payment Method",
              hintText: "Wise App",
              controller: _textRequestDate,
            ),
            MySubmitButtonFilled(
              title: "Add Payment details",
              onPressed: () {
                context.push(AppRoutes.selectPaymentScreen.path);
              },
            ),
            20.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
