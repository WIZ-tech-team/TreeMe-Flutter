import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:treeme/core/routes/app_routes.dart';

class LoginController extends GetxController {
  late TapGestureRecognizer signUpRecognizer;

  @override
  void onInit() {
    signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.toNamed(AppRoutes.register);
      };
    super.onInit();
  }
}
