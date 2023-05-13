import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TapGestureRecognizer signUpRecognizer;

  @override
  void onInit() {
    signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.back();
      };
    super.onInit();
  }
}
