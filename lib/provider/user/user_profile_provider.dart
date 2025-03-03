import 'dart:io';

import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  TextEditingController textCountry = TextEditingController(text: "+91");
  File? fileImage;
  String countryPhoneCode = "+91";
  int phoneNumLength = 10;


  void updateCountryPhoneCode(
      {required String phoneCode, required int length}) {
    textCountry.text = phoneCode;
    countryPhoneCode = phoneCode;
    phoneNumLength = length;
    notifyListeners();
  }

  void uploadProfileImage(String imagePath) {
    fileImage = File(imagePath);
  }
}
