import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:treeme/core/routes/app_routes.dart';

import '../../../../core/utils/error_toast.dart';
import '../../data/data_sources/auth_data_source.dart';

class LoginController extends GetxController {
  late TapGestureRecognizer signUpRecognizer;
  final IAuthDataSource _authDataSource;

  LoginController(this._authDataSource);
  bool showPass = false;

  final TextEditingController loginNumberController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  @override
  void onInit() {
    signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.toNamed(AppRoutes.register);
      };
    super.onInit();
  }

  Future<void> login(String password, String phone) async {
    final registerModel = await _authDataSource.login(phone, password);
    registerModel.fold(
        (l) => errorToast(l.message), (r) => successToast(r.message!));
    clearTextField();
  }

  showPassword() {
    showPass = !showPass;
    update();
  }

  void clearTextField() {
    loginPasswordController.clear();
    loginNumberController.clear();
  }
}
