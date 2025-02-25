import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as form_data;

import '../../core/utils/global.dart';

class AuthService {
  AuthService._();

  static AuthService authService = AuthService._();

  Future<bool> signUpApi(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber,
      required String referralCode}) async {
    Dio dio = Dio();
    form_data.FormData form;

    form = form_data.FormData.fromMap({
      // 'token': token,
      'email': email,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'referralCode': referralCode,
    });

    var response = await dio.post(
      '/signup.php', //todo paste base url here
      data: form,
    );

    if (response.statusCode == 200) {
      var data = response.data;
      if (data['status'] == 'true') {
        showToast("Register Successfully");
        return true;
      } else {
        showToast("Register Failed");
        return false;
      }
    } else {
      showToast("Register Failed");
      return false;
    }
  }

  Future<bool> signInApi(
      {required String email,
      required String password,
      required String referralCode}) async {
    Dio dio = Dio();
    form_data.FormData form;

    form = form_data.FormData.fromMap({
      // 'token': token,
      'email': email,
      'password': password,
      'referralCode': referralCode,
    });

    var response = await dio.post(
      '/signin.php', //todo paste base url here
      data: form,
    );

    if (response.statusCode == 200) {
      var data = response.data;
      if (data['status'] == 'true') {
        showToast("Register Successfully");
        return true;
      } else {
        showToast("Register Failed");
        return false;
      }
    } else {
      showToast("Register Failed");
      return false;
    }
  }

  Future<bool> forgotPasswordApi({required String email}) async {
    Dio dio = Dio();
    form_data.FormData form;

    form = form_data.FormData.fromMap({
      // 'token': token,
      'email': email,
    });

    var response = await dio.post(
      '/forgotPassword.php', //todo paste base url here
      data: form,
    );

    if (response.statusCode == 200) {
      var data = response.data;
      if (data['status'] == 'true') {
        showToast("Password Changed Successfully");
        return true;
      } else {
        showToast("Failed");
        return false;
      }
    } else {
      showToast("Failed");
      return false;
    }
  }
}
