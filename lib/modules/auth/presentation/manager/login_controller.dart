import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:treeme/core/helpers/constants.dart';
import 'package:treeme/core/routes/app_routes.dart';
import 'package:treeme/core/utils/services/storage.dart';

import '../../../../core/utils/error_toast.dart';
import '../../data/data_sources/auth_data_source.dart';
import '../pages/otp_login_screen.dart';

class LoginController extends GetxController {
  late TapGestureRecognizer signUpRecognizer;
  late TapGestureRecognizer forgotPasswordRecognizer;
  final IAuthDataSource _authDataSource;
  final Storage _storage;
  LoginController(this._authDataSource, this._storage);
  bool showPass = true;
  String? verificationIdUser = '';
  String errorText = '';
  String sendCode = '';
  String oTPCode = '';
  late StreamController<ErrorAnimationType> errorController;
  final TextEditingController loginNumberController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    signUpRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.toNamed(AppRoutes.register);
      };
    forgotPasswordRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Get.toNamed(AppRoutes.forgotPassword);
      };
    getFcmToken();
    permission();
    super.onInit();
  }

  Future<void> login(String password, String phone) async {
    final registerModel =
        await _authDataSource.login(phone, password, _storage.refreshToken ?? '');
    registerModel.fold((l) {
      // _verifyPhone(loginNumberController.text.trim());
      errorToast(l.message);
    }, (r) async {
      _storage.jwtToken = r.token?.apiToken ?? '';
      _storage.fistName = r.data?.name ?? '';
      _storage.firebaseUID = r.data?.firebaseUid ?? '';
      _storage.phoneNumber = r.data?.phone ?? '';
      _storage.userId = r.data?.id.toString() ?? '';
      _storage.isLoggedIn = true;
      AppConfig.firstName = _storage.fistName;
      AppConfig.firstName = _storage.fistName;
      AppConfig.userId = _storage.userId;
      AppConfig.phoneNumber = r.data?.phone ?? '';
      print('tokem ${_storage.jwtToken}');
      successToast('A code will be sent to you');
      await verifyPhone(r.data?.phone);
      successToast(r.message!);

      // Get.toNamed(AppRoutes.)
// FirebaseChatCore.instance.firebaseUser = FirebaseAuth.instance.currentUser ;
      //
    });
    clearTextField();
  }

  showPassword() {
    showPass = !showPass;
    update();
  }

  void clearTextField() {
    loginPasswordController.clear();
    loginNumberController.clear();
    numberController.clear();
  }

  @override
  void dispose() {
    loginPasswordController.dispose();
    loginNumberController.dispose();
    numberController.dispose();
    super.dispose();
  }

  verfiy() {
    if (oTPCode == sendCode) {
      successToast('Code is Correct');
    } else {
      errorController.add(ErrorAnimationType.shake);
      errorToast('Code is Wrong');
    }
  }

  Future<void> verifyPhone(String? phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Get.toNamed(AppRoutes.navBar);
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => Home()),
              //         (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          verificationIdUser = verficationID;
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          Get.to(() => OTPLoginScreen());
        },
        timeout: Duration(seconds: 3));
  }

  Future<void> permission() async {
    var per = Permission.contacts.request();
    var status = await Permission.contacts.status;
    if (status.isDenied) {
      bool isShown = await Permission.contacts.shouldShowRequestRationale;
    }

// You can can also directly ask the permission about its status.
//     if (await Permission.location.isRestricted) {
//       // The OS restricts access, for example because of parental controls.
//     }
  }

  Future<void> getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    _storage.refreshToken = token ?? '';
    log('fcmtoken ${token.toString()}');
  }
}
// PhoneAuthCredential credential = PhoneAuthProvider.credential(
//     verificationId:
//     'AIE-54XDdZ5RPJnurjZcnhxP49-neIzFLSW3LcV0y85A_StgJcdhxo9Yv1IoxazIxL6ZIyfOL2FAJipaBhZBXPPCCD5d9QvjRnlqwN1TJcKVlJpabRBwbZGM5ADKwwZwoUJwQzB92gFFfgjpbsChTOYfNj5q3DvEYA',
//     smsCode: '000000');
//
// UserCredential user = await auth.signInWithCredential(credential);
// print("Signed in with temporary $user.");
