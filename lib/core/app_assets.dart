class Assets {
  static String base = "assets/images";
}

class AppAssets extends Assets {
  AppAssets._();

 static AppAssets appAssets = AppAssets._();

  static String get appLogo => "${Assets.base}/app_logo/logo.png";
  static String get appleLogo => "${Assets.base}/auth_screen/apple_logo.svg";
  static String get faceBookLogo => "${Assets.base}/auth_screen/facebook.svg";
  static String get googleLogo => "${Assets.base}/auth_screen/google.svg";
  static String get invalidRef => "${Assets.base}/auth_screen/invalid_ref.svg";
  static String get onBoarding1 => "${Assets.base}/auth_screen/on_b1.png";
  static String get onBoarding2 => "${Assets.base}/auth_screen/on_b2.png";
  static String get onBoarding3 => "${Assets.base}/auth_screen/on_b3.png";
  static String get onBoarding4 => "${Assets.base}/auth_screen/on_b4.png";
  static String get onBoarding5 => "${Assets.base}/auth_screen/on_b5.png";
  static String get successMsg1 => "${Assets.base}/auth_screen/success_msg_1.svg";
  static String get successMsg2 => "${Assets.base}/auth_screen/success_msg_2.svg";
  static String get cardImage => "${Assets.base}/card.svg";
  static String get failedPayment => "${Assets.base}/failed_payment.png";
  static String get headPhone => "${Assets.base}/headPhone.svg";
  static String get successPayment => "${Assets.base}/success_payment.png";
  static String get googlePaymentImage => "${Assets.base}/google.svg";
  static String get applePaymentImage => "${Assets.base}/apple.svg";
  static String get luckyDraw => "${Assets.base}/luckyDraw.png";
  static String get homeIcon => "${Assets.base}/home.svg";
  static String get myPostIcon => "${Assets.base}/my_post.svg";
  static String get earnings => "${Assets.base}/earnings.svg";
  static String get profileIcon => "${Assets.base}/profile.svg";
  static String get bankEdit => "${Assets.base}/bank_edit.svg";
  static String get editIcon => "${Assets.base}/edit.svg";
  static String get payOutIcon => "${Assets.base}/payOut.svg";
  static String get staffsIcon => "${Assets.base}/staff.svg";
  static String get luckyDrawIcon => "${Assets.base}/luckyDrawIcon.svg";
}