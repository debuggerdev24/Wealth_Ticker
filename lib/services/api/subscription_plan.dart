import 'package:dio/dio.dart';
import 'package:dio/src/form_data.dart' as form_data;

import '../../core/utils/global.dart';

class SubscriptionPlanService {
  SubscriptionPlanService._();

  static SubscriptionPlanService authService = SubscriptionPlanService._();

  Future<bool> signUpApi(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber,
      required String referralCode}) async {
    Dio dio = Dio();
    form_data.FormData form;

    try {
      var response = await dio.get(
        '/signup.php', //todo paste base url here
      );

      if (response.statusCode == 200 && response.data["status"] == true) {
        showToast("plans get successfully");
      }
      return true;
    } catch (e) {
      showToast("Error plans get successfully");
      return false;
    }
  }
}
