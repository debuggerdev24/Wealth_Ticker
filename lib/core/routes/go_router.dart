import 'package:go_router/go_router.dart';
import 'package:wealth_ticker_main/core/routes/routes.dart';
import 'package:wealth_ticker_main/model/post_model.dart';
import 'package:wealth_ticker_main/view/admin/lucky_draw_manager/lucky_draw_details_screen.dart';
import 'package:wealth_ticker_main/view/admin/lucky_draw_manager/manage_particpant_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/bank_details_screen.dart';
import 'package:wealth_ticker_main/view/users/earnings/week_lucky_draw_screen.dart';
import 'package:wealth_ticker_main/view/users/my_post/post_details_screen.dart';
import 'package:wealth_ticker_main/view/users/subscription/lucky_draw_screen.dart';
import 'package:wealth_ticker_main/view/users/subscription/success_payment_screen.dart';
import 'package:wealth_ticker_main/view/users/user_dashboard_screen.dart';
import '../../view/admin/admin_dashboard_screen.dart';
import '../../view/admin/lucky_draw_manager/lucky_draw_management.dart';
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
  initialLocation: AppRoutes.adminDashBoardScreen.path, //splashScreen
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
      path: AppRoutes.successPaymentScreen.path,
      name: AppRoutes.successPaymentScreen.name,
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
    // GoRoute(
    //   path: AppRoutes.luckyDrawScreen.path,
    //   name: AppRoutes.luckyDrawScreen.name,
    //   builder: (context, state) {
    //     return LuckyDrawScreen();
    //   },
    // ),
    GoRoute(
      path: AppRoutes.userFlowScreen.path,
      name: AppRoutes.userFlowScreen.name,
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
  ],
);
