import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/field_validator.dart';
import 'package:wealth_ticker_main/core/theme/app_colors.dart';
import 'package:wealth_ticker_main/core/utils/global.dart';
import 'package:wealth_ticker_main/core/widgets/my_app_layout.dart';
import 'package:wealth_ticker_main/core/widgets/my_button.dart';
import 'package:wealth_ticker_main/core/widgets/my_textfield.dart';
import 'package:wealth_ticker_main/provider/user/earning_provider.dart';
import 'package:wealth_ticker_main/provider/user/earning_provider.dart';
import 'package:wealth_ticker_main/provider/user/earning_provider.dart';
import 'package:wealth_ticker_main/provider/user/earning_provider.dart';
import 'package:wealth_ticker_main/view/users/earnings/widget/error_widget.dart';
import '../../../provider/auth/auth_provider.dart';

TextEditingController _textCountry = TextEditingController();
TextEditingController _textAccHolderName = TextEditingController();
TextEditingController _textAccNumberOrIban = TextEditingController();
TextEditingController _textBankName = TextEditingController();
TextEditingController _textBranchName = TextEditingController();
TextEditingController _textSwiftCode = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey();

class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EarningsProvider providerTrue =
        Provider.of<EarningsProvider>(context, listen: true);
    EarningsProvider provider = Provider.of<EarningsProvider>(context);
    return MyAppLayOut(
      title: "Bank Details",
      body: Form(
        key: _formKey,
        child: Padding(
          padding: appPadding(),
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
                    MyTextField(
                      readOnly: true,
                      title: "Select Country",
                      hintText: "Choose your country",
                      controller: _textCountry,
                      suffix: myCountryCodePicker(
                        context,
                        (country) {
                          provider.updateCountryPhoneCode(
                            phoneCode: "+ ${country.phoneCode}",
                            length: country.example.length,
                          );
                        },
                        providerTrue.countryPhoneCode,
                      ),
                    ),
                    Column(
                      children: [
                        MyTextField(
                          title: "Account Holder Name",
                          hintText: "Enter your full name",
                          controller: _textAccHolderName,
                          validator: (value) {
                            provider.updateValidationStatus(
                              field: "accountHolderName",
                              error: FieldValidators()
                                      .required(value, "Account holder name") ??
                                  "",
                            );
                            return null;
                          },
                        ),
                        providerTrue.accountHolderNameError.isEmpty
                            ? SizedBox()
                            : CustomErrorWidget(
                                errorMessage:
                                    providerTrue.accountHolderNameError,
                                paddingLeft: 12.w,
                              ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyTextField(
                          title: "Account Number/IBAN",
                          hintText: "Enter your account number or IBAN",
                          controller: _textAccNumberOrIban,
                          validator: (value) {
                            String error = FieldValidators()
                                    .required(value, "Account Number") ??
                                "";
                            provider.updateValidationStatus(
                                field: "accountNumber", error: error);
                            return null;
                          },
                        ),
                        providerTrue.accountNumberError.isEmpty
                            ? SizedBox()
                            : CustomErrorWidget(
                                errorMessage: providerTrue.accountNumberError,
                                paddingLeft: 12.w,
                              ),
                      ],
                    ),
                    Column(
                      children: [
                        MyTextField(
                          title: "Bank Name",
                          hintText: "Enter your bank's name",
                          controller: _textBankName,
                          validator: (value) {
                            provider.updateValidationStatus(
                              field: "bankName",
                              error: FieldValidators()
                                      .required(value, "Bank name") ??
                                  "",
                            );
                            return null;
                          },
                        ),
                        providerTrue.bankNameError.isEmpty
                            ? SizedBox()
                            : CustomErrorWidget(
                                errorMessage: providerTrue.bankNameError,
                                paddingLeft: 12.w,
                              )
                      ],
                    ),
                    MyTextField(
                      isOptional: true,
                      optionShowText: "(if applicable)",
                      title: "Branch Name",
                      hintText: "Enter the branch name",
                      controller: _textBranchName,
                    ),
                    MyTextField(
                      textInputAction: TextInputAction.done,
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
                      tristate: true,
                      value: providerTrue.confirmation,
                      activeColor: AppColors.darkGreenColor,
                      onChanged: (value) {
                        provider.updateConfirmation();
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          provider.updateConfirmation();
                        },
                        child: Text(
                          // textDirection: TextDecoration.ltr,
                          '“I confirm that the bank account details entered are correct and belong to me."',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                35.h.verticalSpace,
                MySubmitButtonFilled(
                  title: "Save Bank Details",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                20.h.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
