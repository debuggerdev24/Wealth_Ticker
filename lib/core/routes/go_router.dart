import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/model/user/post_model.dart';
import 'package:wealth_ticker_main/view/admin/lucky_draw/confirm_winner_screen.dart';
import 'package:wealth_ticker_main/view/admin/lucky_draw/past_winners_screen.dart';
import 'package:wealth_ticker_main/view/admin/lucky_draw/winner_selected_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/confirm_section_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/failure_popup_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/payout_list_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/process_payout_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/select_payment_screen.dart';
import 'package:wealth_ticker_main/view/admin/pay_out/success_popup_screen.dart';
import 'package:wealth_ticker_main/view/admin/post/edit_post_screen.dart';
import 'package:wealth_ticker_main/view/role/user_role_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/bank_details_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/count_down_week_lucky_draw_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/lucky_draw_winner.dart';
import 'package:wealth_ticker_main/view/users/my_post/purchased_post_details_screen.dart';
import 'package:wealth_ticker_main/view/users/my_post/purchased_post_list_screen.dart';
import 'package:wealth_ticker_main/view/users/subscription/lucky_draw_message_screen.dart';
import 'package:wealth_ticker_main/view/users/subscription/success_payment_screen.dart';
import 'package:wealth_ticker_main/view/users/user_dashboard_screen.dart';
import '../../view/admin/admin_dashboard_screen.dart';
import '../../view/admin/lucky_draw/details_screen.dart';
import '../../view/admin/lucky_draw/manage_particpant_screen.dart';
import '../../view/admin/lucky_draw/management_screen.dart';
import '../../view/auth/error_msg_screen.dart';
import '../../view/auth/forgot_password.dart';
import '../../view/auth/otp_screen.dart';
import '../../view/auth/sign_in_screen.dart';
import '../../view/auth/sign_up_screen.dart';
import '../../view/auth/success_msg_screen_1.dart';
import '../../view/on_boarding/on_boarding_screen.dart';
import '../../view/splash_screen/splash_screen.dart';
import '../../view/users/earnings/past_winners_screen.dart';
import '../../view/users/home/chat_screen.dart';
import '../../view/users/home/group_screen.dart';
import '../../view/users/home/home_screen.dart';
import '../../view/auth/success_msg_scxreen_2.dart';
import '../../view/users/home/one_to_one_chat_screen.dart';
import '../../view/users/invite_friends/invite_friend_screen.dart';
import '../../view/users/notification/notification_screen.dart';
import '../../view/users/profile/profile_screen.dart';
import '../../view/users/subscription/card_payment_screen.dart';
import '../../view/users/subscription/failed_payment_screen.dart';
import '../../view/users/subscription/select_payment_screen.dart';
import '../../view/users/subscription/subscription_group_screen.dart';
import '../../view/users/support/faq_screen.dart';
import '../../view/users/support/send_email_screen.dart';
import '../../view/users/support/support_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: AppRoutes.adminDashBoardScreen.path, //splash
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.splashScreen.path,
      name: AppRoutes.splashScreen.name,
      builder: (context, state) {
        // final String name = state.extra as String;
        return SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.signUpScreen.path,
      name: AppRoutes.signUpScreen.name,
      builder: (context, state) {
        return SignUpScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.signInScreen.path,
      name: AppRoutes.signInScreen.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return SignInScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.errorMsgScreen.path,
      name: AppRoutes.errorMsgScreen.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return ErrorMsgScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.successMsgScreen1.path,
      name: AppRoutes.successMsgScreen1.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return SuccessMsgScreen1();
      },
    ),
    GoRoute(
      path: AppRoutes.successMsgScreen2.path,
      name: AppRoutes.successMsgScreen2.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return SuccessMsgScreen2();
      },
    ),
    GoRoute(
      path: AppRoutes.onBoardingScreen.path,
      name: AppRoutes.onBoardingScreen.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return OnBoardingScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.forgotPasswordScreen.path,
      name: AppRoutes.forgotPasswordScreen.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return ForgotPassword();
      },
    ),
    GoRoute(
      path: AppRoutes.otpScreen.path,
      name: AppRoutes.otpScreen.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return OTPScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.homeScreen.path,
      name: AppRoutes.homeScreen.name,
      builder: (context, state) {
        // final double amount = state.extra as double;
        return HomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.profileScreen.path,
      name: AppRoutes.profileScreen.name,
      builder: (context, state) {
        return ProfileScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.inviteScreen.path,
      name: AppRoutes.inviteScreen.name,
      builder: (context, state) {
        return InviteProfileScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.notificationScreen.path,
      name: AppRoutes.notificationScreen.name,
      builder: (context, state) {
        return NotificationScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.supportsScreen.path,
      name: AppRoutes.supportsScreen.name,
      builder: (context, state) {
        return SupportScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.sendUsEmailScreen.path,
      name: AppRoutes.sendUsEmailScreen.name,
      builder: (context, state) {
        return SendUsEmailScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.chatScreen.path,
      name: AppRoutes.chatScreen.name,
      builder: (context, state) {
        return ChatScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.groupScreen.path,
      name: AppRoutes.groupScreen.name,
      builder: (context, state) {
        return GroupScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.faqScreen.path,
      name: AppRoutes.faqScreen.name,
      builder: (context, state) {
        return FaqScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.subscriptionGroupScreen.path,
      name: AppRoutes.subscriptionGroupScreen.name,
      builder: (context, state) {
        return SubscriptionGroupScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.selectPaymentMethodScreen.path,
      name: AppRoutes.selectPaymentMethodScreen.name,
      builder: (context, state) {
        return SelectPaymentMethodeScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.cardPaymentScreen.path,
      name: AppRoutes.cardPaymentScreen.name,
      builder: (context, state) {
        return CardPaymentScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.successPaymentScreenUser.path,
      name: AppRoutes.successPaymentScreenUser.name,
      builder: (context, state) {
        return SuccessPaymentScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.failedPaymentScreen.path,
      name: AppRoutes.failedPaymentScreen.name,
      builder: (context, state) {
        return FailedPaymentScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.oneToOneChat.path,
      name: AppRoutes.oneToOneChat.name,
      builder: (context, state) {
        return OneToOneChatScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.adminDashBoardScreen.path,
      name: AppRoutes.adminDashBoardScreen.name,
      builder: (context, state) {
        return AdminDashboardScreen();
      },
    ),
    // GoRoute(
    //   path: AppRoutes.userManagement.path,
    //   name: AppRoutes.userManagement.name,
    //   builder: (context, state) {
    //     return UserManagement();
    //   },
    // ),
    GoRoute(
      path: AppRoutes.luckyDrawScreen.path,
      name: AppRoutes.luckyDrawScreen.name,
      builder: (context, state) {
        return LuckyDrawMessageScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.userDashBoardScreen.path,
      name: AppRoutes.userDashBoardScreen.name,
      builder: (context, state) {
        return UserDashBoardScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.luckyDrawManagementScreenAdmin.path,
      name: AppRoutes.luckyDrawManagementScreenAdmin.name,
      builder: (context, state) {
        return LuckyDrawManagementScreenAdmin();
      },
    ),
    GoRoute(
      path: AppRoutes.postDetailsScreen.path,
      name: AppRoutes.postDetailsScreen.name,
      builder: (context, state) {
        final PurchasedPostModel post = state.extra as PurchasedPostModel;
        return PostDetailsScreen(post: post);
      },
    ),
    GoRoute(
      path: AppRoutes.weekLuckyDrawScreen.path,
      name: AppRoutes.weekLuckyDrawScreen.name,
      builder: (context, state) {
        return WeekLuckyDrawScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.pastWinnersScreen.path,
      name: AppRoutes.pastWinnersScreen.name,
      builder: (context, state) {
        return PastWinnersScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.bankDetailsScreen.path,
      name: AppRoutes.bankDetailsScreen.name,
      builder: (context, state) {
        return BankDetailsScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.luckyDrawDetailsScreen.path,
      name: AppRoutes.luckyDrawDetailsScreen.name,
      builder: (context, state) {
        return LuckyDrawDetailsScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.manageParticipantsScreen.path,
      name: AppRoutes.manageParticipantsScreen.name,
      builder: (context, state) {
        return ManageParticipantScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.confirmWinner.path,
      name: AppRoutes.confirmWinner.name,
      builder: (context, state) {
        return ConfirmWinner();
      },
    ),
    GoRoute(
      path: AppRoutes.winnerSelected.path,
      name: AppRoutes.winnerSelected.name,
      builder: (context, state) {
        return WinnerSelectedScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.payOutUsersScreen.path,
      name: AppRoutes.payOutUsersScreen.name,
      builder: (context, state) {
        return PayoutUsersListScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.pastWinnersScreenAdmin.path,
      name: AppRoutes.pastWinnersScreenAdmin.name,
      builder: (context, state) {
        return PastWinnersScreenAdmin();
      },
    ),
    GoRoute(
      path: AppRoutes.processPayoutScreen.path,
      name: AppRoutes.processPayoutScreen.name,
      builder: (context, state) {
        return ProcessPayoutScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.selectPaymentScreen.path,
      name: AppRoutes.selectPaymentScreen.name,
      builder: (context, state) {
        return SelectPaymentScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.confirmationSectionScreen.path,
      name: AppRoutes.confirmationSectionScreen.name,
      builder: (context, state) {
        return ConfirmSectionScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.successPopUpScreen.path,
      name: AppRoutes.successPopUpScreen.name,
      builder: (context, state) {
        return SuccessPopupScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.failurePopupScreen.path,
      name: AppRoutes.failurePopupScreen.name,
      builder: (context, state) {
        return FailurePopupScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.editPostScreen.path,
      name: AppRoutes.editPostScreen.name,
      builder: (context, state) {
        return EditPostScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.userRoleScreen.path,
      name: AppRoutes.userRoleScreen.name,
      builder: (context, state) {
        return UserRoleScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.purchasedPostListScreen.path,
      name: AppRoutes.purchasedPostListScreen.name,
      builder: (context, state) {
        return PurchasedPostList();
      },
    ),
    GoRoute(
      path: AppRoutes.luckyDrawWinnerScreen.path,
      name: AppRoutes.luckyDrawWinnerScreen.name,
      builder: (context, state) {
        return LuckyDrawWinnerScreen();
      },
    ),
  ],
);
