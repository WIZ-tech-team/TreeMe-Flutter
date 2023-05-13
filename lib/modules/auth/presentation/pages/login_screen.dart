import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/color_manager.dart';
import 'package:treeme/core/resources/strings_manager.dart';
import 'package:treeme/core/resources/values_manager.dart';
import 'package:treeme/core/routes/app_routes.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widgets/custom_textField_with_label.dart';
import '../manager/login_controller.dart';
import '../widgets/option_auth_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Shader linearGradient = LinearGradient(
    //   colors: [
    //     Color(0xffFBD4A4),
    //     Color(0xffFEAA46),
    //   ], // Specify the colors of the gradient
    //   begin: Alignment.bottomCenter, // Specify the start point of the gradient
    //   end: Alignment.topCenter, // Specify the end point of the gradient
    // ).createShader(
    //   Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
    // );

    return Scaffold(
      backgroundColor: ColorManager.authBackGround,
      body: Container(
        color: ColorManager.authBackGround,
        padding: EdgeInsets.symmetric(horizontal: AppSize.s18.w),
        child: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<LoginController>(builder: (logic) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(ImageAssets.hotAirBallon),
                    ],
                  ),
                  Text(
                    AppStrings.login,
                    style: getBoldStyle(
                        fontSize: FontSize.s30.sp,
                        decoration: TextDecoration.none,
                        color: const Color(0xffFEAA46)),
                  ),
                  SizedBox(
                    height: AppSize.s14.h,
                  ),
                  RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(children: [
                        TextSpan(
                            text: AppStrings.onBoardingLabel,
                            style: getMediumStyle(
                                color: ColorManager.textFont1Color,
                                fontSize: FontSize.s16.sp),
                            children: [
                              WidgetSpan(
                                  child: Lottie.network(
                                      'https://fonts.gstatic.com/s/e/notoemoji/latest/1f609/lottie.json',
                                      height: AppSize.s20.h,
                                      width: AppSize.s20.w)),
                            ])
                      ])),
                  SizedBox(
                    height: AppSize.s53.h,
                  ),
                  CustomTextFieldWithLabel(
                    label: AppStrings.userName,
                    hint: AppStrings.userName.toLowerCase(),
                  ),
                  SizedBox(
                    height: AppSize.s24.h,
                  ),
                  CustomTextFieldWithLabel(
                    label: AppStrings.password,
                    hint: AppStrings.passwordHint,
                    suffix: Icon(
                      Icons.visibility_off_outlined,
                      size: AppSize.s20.h,
                      color: ColorManager.black.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s36.h,
                  ),
                  Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        gradient: ColorManager().gradientButton,
                        boxShadow: [
                          BoxShadow(
                              color: ColorManager.mainColor.withOpacity(0.3),
                              offset: const Offset(-0, 22),
                              blurRadius: 6,
                              spreadRadius: -12)
                        ],
                        borderRadius: BorderRadius.circular(AppSize.s16.r)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          disabledBackgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSize.s16.r)),
                          padding: EdgeInsets.zero,
                          minimumSize: Size(double.infinity, 64.h)),
                      onPressed: () => Get.toNamed(AppRoutes.navBar),
                      child: Text(
                        AppStrings.login,
                        style: getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s16.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s32.h,
                  ),
                  Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: AppStrings.dontHaveAcc,
                              style: getRegularStyle(
                                  color: ColorManager.black.withOpacity(0.7),
                                  fontSize: FontSize.s14.sp),
                              children: [
                                TextSpan(
                                  text: AppStrings.signUp.toUpperCase(),
                                  recognizer: logic.signUpRecognizer,
                                  style: getBoldStyle(
                                      color: ColorManager.authText,
                                      fontSize: FontSize.s14.sp),
                                )
                              ]),
                        ])),
                  ),
                  SizedBox(
                    height: AppSize.s85.h,
                  ),
                  Center(
                    child: Text(
                      AppStrings.otherSignInOpt,
                      style: getRegularStyle(
                          color: ColorManager.black.withOpacity(0.7),
                          fontSize: FontSize.s14.sp),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const OptionAuthWidget(
                        icon: ImageAssets.facebookLogo,
                      ),
                      SizedBox(
                        width: AppSize.s11.w,
                      ),
                      const OptionAuthWidget(
                        icon: ImageAssets.googleLogo,
                      ),
                      SizedBox(
                        width: AppSize.s11.w,
                      ),
                      const OptionAuthWidget(
                        icon: ImageAssets.appleLogo,
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
