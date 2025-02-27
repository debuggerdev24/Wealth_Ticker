import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/core/widgets/my_textfield.dart';
import 'package:wealth_ticker_main/view/users/earnings/widget/error_widget.dart';
import '../../../provider/auth/auth_provider.dart';

TextEditingController _textCountry = TextEditingController();
TextEditingController _textAccHolderName = TextEditingController();
TextEditingController _textAccNumberOrIban = TextEditingController();
TextEditingController _textBankName = TextEditingController();
TextEditingController _textBranchName = TextEditingController();
TextEditingController _textSwiftCode = TextEditingController();

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider providerTrue =
        Provider.of<AuthProvider>(context, listen: true);
    AuthProvider providerFalse = Provider.of<AuthProvider>(context);
    return MyAppLayOut(
      title: "Bank Details",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 5.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.h.verticalSpace,
              Text(
                '"Please enter your bank account details to register for payouts. Ensure that the details are accurate and unique to your account."',
                style: TextStyle(
                  color: Color(0xff808080),
                  fontSize: 12.sp,
                ),
              ),
              24.h.verticalSpace,
              Column(
                spacing: 18.h,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextField(
                        title: "Select Country",
                        hintText: "Choose your country",
                        controller: _textCountry,
                        suffix: myCountryCodePicker(context, providerFalse, providerTrue)
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MyTextField(
                        title: "Account Holder Name",
                        hintText: "Enter your full name",
                        controller: _textAccHolderName,
                      ),
                      2.h.verticalSpace,
                      CustomErrorWidget(errorMessage: "Invalid your Account Holder name"),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextField(
                        title: "Account Number/IBAN",
                        hintText: "Enter your account number or IBAN",
                        controller: _textAccNumberOrIban,
                      ),
                      2.h.verticalSpace,
                      CustomErrorWidget(errorMessage: "Invalid your Account number or IBAN"),
                    ],
                  ),
                  Column(
                    children: [
                      MyTextField(
                        title: "Bank Name",
                        hintText: "Enter your bank's name",
                        controller: _textBankName,
                      ),
                      2.h.verticalSpace,
                      CustomErrorWidget(errorMessage: "Invalid your Bank name"),
                    ],
                  ),
                  Column(
                    children: [
                      MyTextField(
                        isOptional: true,
                        optionShowText: "(if applicable)",
                        title: "Branch Name",
                        hintText: "Enter the branch name",
                        controller: _textBranchName,
                      ),
                      2.h.verticalSpace,
                      CustomErrorWidget(errorMessage: "Invalid your Branch name"),
                    ],
                  ),
                  MyTextField(
                    isOptional: true,
                    optionShowText: "(if applicable)",
                    title: "SWIFT Code",
                    hintText: "Enter SWIFT/BIC code",
                    controller: _textSwiftCode,
                  ),
                ],
              ),
              18.h.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  // 12.w.horizontalSpace,
                  Expanded(
                    child: Text(
                      '“I confirm that the bank account details entered are correct and belong to me."',
                      style: TextStyle(
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                ],
              ),
              35.h.verticalSpace,
              MySubmitButtonFilled(
                title: "Save Bank Details",
                onPressed: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
