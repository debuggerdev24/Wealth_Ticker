import 'package:country_picker/country_picker.dart';
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
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          countryListTheme: CountryListThemeData(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                18.r,
                              ),
                              topRight: Radius.circular(
                                18.r,
                              ),
                            ),
                            inputDecoration: InputDecoration(
                              hintText: "Search Country...",
                              hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                              prefixIcon: Icon(CupertinoIcons.search,
                                  color: Colors.grey.shade700),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: AppColors.darkGreenColor,
                                    width: 1.5),
                              ),
                            ),
                          ),
                          onSelect: provider.updateCountry
                        );
                      },
                      readOnly: true,
                      title: "Select Country",
                      hintText: "Choose your Country",
                      controller: providerTrue.textCountry,
                      suffix: myCountryCodePicker(
                        context,
                        provider.updateCountry,
                        providerTrue.country.flagEmoji,
                      ),
                    ),
                    Column(
                      children: [
                        MyTextField(
                          title: "Account Holder Name",
                          hintText: "Enter Account Holder Name",
                          controller: _textAccHolderName,
                          validator: (value) {
                            String error = FieldValidators().multiCheck(
                                  value,
                                  [
                                    (value) => FieldValidators()
                                        .required(value, "Account Holder Name"),
                                    FieldValidators().fullName,
                                  ],
                                ) ??
                                "";
                            provider.updateValidationStatus(
                                field: "accountHolderName", error: error);
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
                          hintText: "Enter your Account Number or IBAN",
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
                          hintText: "Enter your Bank's Name",
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
                      hintText: "Enter the Branch name",
                      controller: _textBranchName,
                    ),
                    MyTextField(
                      textInputAction: TextInputAction.done,
                      isOptional: true,
                      optionShowText: "(if applicable)",
                      title: "SWIFT Code",
                      hintText: "Enter SWIFT/BIC Code",
                      controller: _textSwiftCode,
                    ),
                  ],
                ),
                20.h.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Color(0xff333333),
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        value: providerTrue.confirmation,
                        activeColor: AppColors.darkGreenColor,
                        onChanged: (value) {
                          provider.updateConfirmation();
                        },
                      ),
                    ),
                    15.w.horizontalSpace,
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
