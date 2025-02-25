
enum AppRoutes{
  splashScreen,
  signUpScreen,
  signInScreen,
  errorMsgScreen,
  successMsgScreen1,
  successMsgScreen2,
  onBoardingScreen,
  forgotPasswordScreen,
  otpScreen,
  drawerScreen,
  profileScreen,
  inviteScreen,
  notificationScreen,
  homeScreen,
  supportsScreen,
  sendUsEmailScreen,
  chatScreen,
  groupScreen,
  faqScreen,
  subscriptionGroupScreen,
  selectPaymentMethodScreen,
  cardPaymentScreen,
  successPaymentScreen,
  failedPaymentScreen,
  oneToOneChat,
  adminDashBoardScreen,
  userManagement,
  luckyDrawScreen,
  userFlowScreen,
  postDetailsScreen,
  weekLuckyDrawScreen, pastWinnersScreen, bankDetailsScreen, luckyDrawManagementScreenAdmin, luckyDrawDetailsScreen, manageParticipantsScreen
}

extension AppRouteExtension on AppRoutes{
  String get path => this == AppRoutes.homeScreen ? "/" : "/$name";
}