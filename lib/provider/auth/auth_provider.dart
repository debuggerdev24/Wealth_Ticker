import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/extension/my_extensions.dart';
import '../../core/routes/routes.dart';
import '../../services/api/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  String countryPhoneCode = "+91";
  int phoneNumLength = 10;
  bool obSecureText = true, isLoading = false;

  Country _country = CountryService().findByPhoneCode("91")!;
  Country get country => _country;
  int get phoneNumLen => _country.example.length;

  //todo -----------------------> validator for sign up
  String fullNameError = "",
      emailError = "",
      mobileNumberError = "",
      refCodeError = "",
      passwordError = "",
      confirmPasswordError = "";
  //todo -----------------------> validator for sign in
  String signInEmailError = "", signInPasswordError = "";

  //todo -----------------------> validator for forgot password
  String forgotPassEmailError = "";


  //todo ---------------> check validation for the sign up
  void updateValidationStatusForSignUp({required String field, required String error}) {
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
      case "confirmPassword":
        confirmPasswordError = error;
        break;
    }
    notifyListeners();
  }

  //todo ---------------> check validation for the sign in
  void updateValidationStatusForSignIn({required String field, required String error}) {
    switch (field) {
      case "email":
        signInEmailError = error;
        break;
      case "password":
        signInPasswordError = error;
        break;
    }
    notifyListeners();
  }

  //todo ---------------> check validation for the forgot password
  void updateValidationStatusForForgotPassword({required String error}) {
    forgotPassEmailError = error;
    notifyListeners();
  }

  void updateCountry(
      Country country) {
    _country = country;
    notifyListeners();
  }

  void changeVisibility() {
    obSecureText = !obSecureText;
    notifyListeners();
  }

  //todo --------------------- SIGN UP
  void signUp(
      {required BuildContext context,
      required String email,
      required String password,
      required String fullName,
      required String phoneNumber,
      required String referralCode}) async {
    try {
      isLoading = true;
      notifyListeners();
      bool check = await AuthService.authService.signUpApi(
          email: email,
          password: password,
          fullName: fullName,
          phoneNumber: phoneNumber,
          referralCode: referralCode);
      if (check && context.mounted) {
        isLoading = false;
        notifyListeners();
        context.pushReplacementNamed(AppRoutes.homeScreen.name);
      }
    } catch (e) {
      myLog(msg: e.toString());
      // showToast("Failed to Login ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }

  //todo --------------------- SIGN IN
  void signIn(
      {required BuildContext context,
      required String email,
      required String password,
      required String fullName,
      required String phoneNumber,
      required String referralCode}) async {
    try {
      isLoading = true;
      notifyListeners();
      bool check = await AuthService.authService.signInApi(
          email: email, password: password, referralCode: referralCode);
      if (check && context.mounted) {
        isLoading = false;
        notifyListeners();
        context.pushReplacementNamed(AppRoutes.homeScreen.name);
      }
    } catch (e) {
      myLog(msg: e.toString());
      // showToast("Failed to Sign up ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }

  //todo --------------------- FORGOT PASSWORD
  Future<void> forgotPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      bool check =
          await AuthService.authService.forgotPasswordApi(email: email);
      if (check && context.mounted) {
        isLoading = false;
        notifyListeners();
        context.pushReplacementNamed(AppRoutes.homeScreen.name);
      }
    } catch (e) {
      myLog(msg: e.toString());
      isLoading = false;
      notifyListeners();
    }
  }
}
