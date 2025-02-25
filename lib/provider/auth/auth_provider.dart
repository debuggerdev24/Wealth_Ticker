import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/app_assets.dart';
import 'package:wealth_ticker_main/core/extension/my_extensions.dart';
import '../../core/routes/routes.dart';
import '../../services/api/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  String countryPhoneCode = "+91";
  int phoneNumLength = 10;
  bool obSecureText = true, isLoading = false;

  void updateCountryPhoneCode({required String phoneCode,required int length}){
    countryPhoneCode = phoneCode;
    phoneNumLength = length;
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
      bool check = await AuthService.authService.forgotPasswordApi(email: email);
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
