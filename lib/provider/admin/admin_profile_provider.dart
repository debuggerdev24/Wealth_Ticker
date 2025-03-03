import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier{
  String countryPhoneCode = "+91";
  int phoneNumLength = 10;

  void updateCountryPhoneCode(
      {required String phoneCode, required int length}) {
    countryPhoneCode = phoneCode;
    phoneNumLength = length;
    notifyListeners();
  }
}