import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingProvider extends ChangeNotifier{
  late SharedPreferences sharedPreferences;
  bool isShow = false;
  int currentPage = 0;

  void pageIndex(int index){
    currentPage = index;
    notifyListeners();
  }

  Future<void> setOnBoarding(bool isShow)async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('show',isShow);
  }

  void removeScreen(){
    isShow = true;
    setOnBoarding(isShow);
    notifyListeners();
  }

  Future<void> getOnBoarding()async {
    sharedPreferences = await SharedPreferences.getInstance();
    isShow = sharedPreferences.getBool('show') ?? false;
  }

  OnBoardingProvider(){
    getOnBoarding();
  }
}