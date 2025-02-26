import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/core/text_styls.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/global.dart';
import '../../../core/widgets/my_app_layout.dart';
import '../../../core/widgets/my_button.dart';
import '../../../provider/subscription_plan_provider.dart';

TextEditingController _textNameOnCard = TextEditingController();
TextEditingController _textCardNumber = TextEditingController();
TextEditingController _textMonth = TextEditingController();
TextEditingController _textYear = TextEditingController();

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SubscriptionPlanProvider provider =
        Provider.of<SubscriptionPlanProvider>(context, listen: true);
    SubscriptionPlanProvider providerFalse =
        Provider.of<SubscriptionPlanProvider>(context);
    return MyAppLayOut(
      title: "Payment by Credit Card",
      body: Padding(
        padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 5.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Payment",
                    style: textStyleW700.copyWith(fontSize: 14.sp),
                  ),
                  Text(
                    "\$9.99",
                    style: textStyleW700.copyWith(fontSize: 18.sp),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 22.h),
                width: 1.sw,
                height: 170.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: Color(0xffA6A6A6),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Credit Card",
                      style: textStyleW700.copyWith(
                        color: Colors.grey.shade700,
                        fontSize: 20.sp,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "---- ---- ----",
                            style: textStyleW700.copyWith(
                              color: Colors.black,
                              fontSize: 18.sp,
                            ),
                          ),
                          TextSpan(
                            text: " 9091",
                            style: textStyleW700.copyWith(
                              color: Colors.grey.shade700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "ETHAN CARTER",
                      style: textStyleW700.copyWith(
                        color: Colors.grey.shade700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              UnderLineInputField(
                hintText: " ETHAN CARTER",
                controller: _textNameOnCard,
                title: "Name on Card",
              ),
              UnderLineInputField(
                  hintText: "2467 4356 7632 9091",
                  controller: _textCardNumber,
                  title: "Card Number"),
              SizedBox(height: 26.h),
              Text(
                "Expiry Date",
                style: textStyleW700.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 90.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: DateInputField(
                        hintText: "MM",
                        controller: _textMonth,
                      ),
                    ),
                    Text(" / "),
                    Expanded(
                      child: DateInputField(
                        hintText: "YY",
                        controller: _textYear,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ),
              30.h.verticalSpace,
              askForSave(provider, providerFalse),
              20.h.verticalSpace,
              MySubmitButtonFilled(
                title: "Confirm & Pay",
                onPressed: () {
                  context.pushNamed(AppRoutes.successPaymentScreen.name);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector askForSave(SubscriptionPlanProvider provider,
      SubscriptionPlanProvider providerFalse) {
    return GestureDetector(
      onTap: () {
        providerFalse.changeStatus();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            activeColor: AppColors.darkGreenColor,
            value: provider.isSavePaymentMethod,
            onChanged: (value) {
              providerFalse.changeStatus();
            },
          ),
          SizedBox(height: 10.w),
          Text("Save this payment method"),
        ],
      ),
    );
  }
}

class UnderLineInputField extends StatelessWidget {
  final String hintText, title;
  final TextEditingController controller;
  final TextInputAction? textInputAction;

  const UnderLineInputField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.title,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: textStyleW700.copyWith(fontSize: 14.sp),
          ),
          SizedBox(height: 5.h),
          TextField(
            controller: controller,
            textInputAction: textInputAction,
            cursorColor: AppColors.darkGreenColor,
            decoration: InputDecoration(
                hintText: hintText,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.darkGreenColor, width: 2))),
          ),
        ],
      ),
    );
  }
}

class DateInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputAction? textInputAction;

  const DateInputField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: AppColors.darkGreenColor,
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.darkGreenColor, width: 2))),
    );
  }
}
