import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';

class AdminProfileProvider extends ChangeNotifier{
  String countryPhoneCode = "+91";
  int phoneNumLength = 10;
  Country _country = CountryService().findByPhoneCode("91")!;


  Country get country => _country;
  int get phoneNumLen => _country.example.length;


  String fullNameError = "",emailError = "", mobileNumberError = "", passwordError = "";

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
}