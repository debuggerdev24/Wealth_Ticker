import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wealth_ticker_main/provider/admin/lucky_draw_provider.dart';
import 'package:wealth_ticker_main/provider/admin/pay_out_provider.dart';
import 'package:wealth_ticker_main/provider/admin/post_provider.dart';
import 'package:wealth_ticker_main/provider/admin/admin_profile_provider.dart';
import 'package:wealth_ticker_main/provider/auth/auth_provider.dart';
import 'package:wealth_ticker_main/provider/auth/on_boarding_provider.dart';
import 'package:wealth_ticker_main/provider/chat_provider.dart';
import 'package:wealth_ticker_main/provider/notification_provider.dart';
import 'package:wealth_ticker_main/provider/subscription_plan_provider.dart';
import 'package:wealth_ticker_main/provider/user/earning_provider.dart';
import 'package:wealth_ticker_main/provider/user/home_provider.dart';
import 'package:wealth_ticker_main/provider/user/post_provider.dart';
import 'core/routes/go_router.dart';
import 'provider/user/user_profile_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionPlanProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => PurchasedPostProvider()),
        ChangeNotifierProvider(create: (_) => EarningsProvider()),
        ChangeNotifierProvider(create: (_) => LuckyDrawProvider()),
        ChangeNotifierProvider(create: (_) => PayOutProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // FocusScope.of(context).unfocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            theme: ThemeData(
              fontFamily: "Open Sans",
              // textTheme:
              //     GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
              // primaryTextTheme: TextTheme(
              //     bodyLarge: TextStyle(
              //       color: Colors.black,
              //         fontWeight: FontWeight
              //             .bold)),
              // todo access this -> style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: goRouter,
          );
        },
      );
}
//Use .w and .h for width and height.
// Use .sp for font sizes.
// t k c l h
// Use .r for border radius.



// -> Worked on creating a user notification screen UI.
// -> Worked on fixing the DropDown issue on the reports Screen.
// -> Worked on fixing the alignment issue on the Report Detail Screen.
// -> Worked on fixing the font issue on the Service & Price Screen.
// -> Worked on app testing and fixing UI issues.