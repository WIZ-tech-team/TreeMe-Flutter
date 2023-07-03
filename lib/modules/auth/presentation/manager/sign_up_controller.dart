import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeme/modules/auth/data/data_sources/auth_data_source.dart';

import '../../../../core/netwrok/failure.dart';
import '../../../../core/utils/error_toast.dart';

class SignUpController extends GetxController {
  late TapGestureRecognizer signUpRecognizer;
  final IAuthDataSource _authDataSource;

  SignUpController(
    this._authDataSource,
  );
  bool showPass = false;
  bool showConfPass = false;

  showPassword() {
    showPass = !showPass;
    update();
  }

  showConfPassword() {
    showConfPass = !showConfPass;
    update();
  }

  @override
  void onInit() {
    signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.back();
      };
    super.onInit();
  }

  final TextEditingController registerNumberController =
      TextEditingController();
  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerPasswordConfirmController =
      TextEditingController();
  clearTextField() {
    registerNumberController.clear();
    registerNameController.clear();
    registerPasswordController.clear();
    registerPasswordConfirmController.clear();
  }

  @override
  void onClose() {
    registerNumberController.dispose();
    registerNameController.dispose();
    registerPasswordController.dispose();
    registerPasswordConfirmController.dispose();
  }

  Future<void> register(String name, String password, String confirmPassword,
      String phone) async {
    final registerModel =
        await _authDataSource.register(name, password, confirmPassword, phone);
    registerModel.fold(
        (l) => errorToast(l.message), (r) => successToast(r.message!));
    clearTextField();
  }
}

extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
