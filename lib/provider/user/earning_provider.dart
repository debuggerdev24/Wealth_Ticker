import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import '../../model/user/earning_model.dart';

class EarningsProvider extends ChangeNotifier {
  TextEditingController textCountry = TextEditingController(text: "+91");

  String countryPhoneCode = "+91",countryFlag = "🇮🇳";
  Country _country = CountryService().findByPhoneCode("91")!;
  int phoneNumLength = 10;
  String accountHolderNameError = "", accountNumberError = "", bankNameError = "", branchNameError = "";
  bool isComplete = false,confirmation = false;

  Country get country => _country;
  int get phoneNumLen => _country.example.length;

  void updateConfirmation(){
    confirmation = !confirmation;
    notifyListeners();
  }

  void updateCountry(
      Country country) {
    textCountry.text = "+ ${country.phoneCode}";
    _country = country;
    notifyListeners();
  }

  void updateValidationStatus({required String field, required String error}) {
    switch (field) {
      case "accountHolderName":
        accountHolderNameError = error;
        break;
      case "accountNumber":
        accountNumberError = error;
        break;
      case "bankName":
        bankNameError = error;
        break;
      case "branchName":
        branchNameError = error;
        break;
    }
    notifyListeners();
  }


  List<PastWinnersModel> pastWinners = [
    PastWinnersModel(
      name: "Isla Clark",
      date: "February 16",
      image:
      "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YLyDK6mXohxlYIYwdjDdSz3i2-tbp8uerjg1cbFO2nt2dqfCizKju9zpYCMdvBF26AqkSCXoGyZzRiVRIWcqOMKm6tGaJ93gKPxYAzr1gTbIqkg1VWZIyu1muQXbmWOtdJKQ7k0-vYKucKKKwLQjPSDeZAzX4Qbgz0IfeePByRmt25j-OYSQvRulR3L6WCTy2spC5lEEGKAa3-CW2WYvLY2rVf3hlYWGTbEYs2kVH0n72tHbbZOV~t2xM2XVE0qQBg8NuzCUtSLnPDhnH~-KP2xqEXewizI4w0U9UDRX2Cj1SVSiWtKI7XJcEKv7NiImsvodTVjAr~0F81Vhn1DhUg__",
      price: "\$1,200",
    ),
    PastWinnersModel(
      name: "Isla Clark",
      date: "February 16",
      image: "https://s3-alpha-sig.figma.com/img/c21c/6896/8665826d72baf80960d2bc4f8f56741e?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YLyDK6mXohxlYIYwdjDdSz3i2-tbp8uerjg1cbFO2nt2dqfCizKju9zpYCMdvBF26AqkSCXoGyZzRiVRIWcqOMKm6tGaJ93gKPxYAzr1gTbIqkg1VWZIyu1muQXbmWOtdJKQ7k0-vYKucKKKwLQjPSDeZAzX4Qbgz0IfeePByRmt25j-OYSQvRulR3L6WCTy2spC5lEEGKAa3-CW2WYvLY2rVf3hlYWGTbEYs2kVH0n72tHbbZOV~t2xM2XVE0qQBg8NuzCUtSLnPDhnH~-KP2xqEXewizI4w0U9UDRX2Cj1SVSiWtKI7XJcEKv7NiImsvodTVjAr~0F81Vhn1DhUg__",
      price: "\$1,200",
    ),
  ];
}
