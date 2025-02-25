import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../provider/auth/auth_provider.dart';

EdgeInsets appPadding(){
  return EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 5.h);

}


Color greenColor = Color(0xff013024);
Color lightGreenColor = Color(0xff329687);


showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16,
  );
}


void countryPicker(BuildContext context, AuthProvider providerFalse,) {
  showCountryPicker(
    context: context,
    showPhoneCode: true,
    countryListTheme: CountryListThemeData(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      inputDecoration: countryInputDecoration(),
    ),
    onSelect: (Country country) {
      providerFalse.updateCountryPhoneCode(
          phoneCode: "+ ${country.phoneCode}",
          length: country.example.length);
    },
  );
}

InputDecoration countryInputDecoration() {
  return InputDecoration(
    hintText: "Search Country...",
    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
    prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey.shade700),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: greenColor, width: 1.5),
    ),
  );
}
