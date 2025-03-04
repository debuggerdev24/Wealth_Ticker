import 'dart:io';

import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  TextEditingController textCountry = TextEditingController(text: "+91");
  File? fileImage;
  String countryPhoneCode = "+91",
   fullNameError = "",emailError = "", mobileNumberError = "", passwordError = "";
  int phoneNumLength = 10;


  void updateValidationStatus({required String field, required String error}) {
    switch (field) {
      case "fullName":
        fullNameError = error;
        break;
      case "email":
        emailError = error;
        break;
      case "mobileNumber":
        mobileNumberError = error;
        break;
      case "password":
        passwordError = error;
        break;
    }
    notifyListeners();
  }

  void updateCountryPhoneCode(
      {required String phoneCode, required int length}) {
    textCountry.text = phoneCode;
    countryPhoneCode = phoneCode;
    phoneNumLength = length;
    notifyListeners();
  }

  void updateProfileImage(String image) {
    fileImage = File(image);
    notifyListeners();
  }
}
