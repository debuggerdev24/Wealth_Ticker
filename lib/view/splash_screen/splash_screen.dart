import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/routes.dart';
import '../../core/utils/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Timer(Duration(seconds: 3),() {
      context.pushReplacementNamed( AppRoutes.signUpScreen.name);
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Image.asset("assets/images/app_logo/logo.png"),
        ),
      ),
    );
  }
}
