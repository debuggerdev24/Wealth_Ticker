import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class UserProfileProvider extends ChangeNotifier {
  TextEditingController textCountry = TextEditingController(text: "+91");
  File? fileImage;
  String fullNameError = "",emailError = "", mobileNumberError = "", passwordError = "";
  Country _country = CountryService().findByPhoneCode("91")!;


  Country get country => _country;

  int get phoneNumLen => _country.example.length;

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

  void updateCountry(Country country) {
    _country = country;
    notifyListeners();
  }

  void updateProfileImage(String image) {
    fileImage = File(image);
    notifyListeners();
  }
}
