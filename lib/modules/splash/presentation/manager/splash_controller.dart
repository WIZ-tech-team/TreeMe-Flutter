import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:treeme/core/routes/app_routes.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController shakeController;
  late Animation<double> shakeAnimation;
  @override
  void onInit() {
    super.onInit();
    shakeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    shakeAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: -5.0, end: 5.0),
        weight: 0.5,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 5.0, end: -5.0),
        weight: 0.5,
      ),
    ]).animate(shakeController);
  }

  void _startShakeAnimation() {
    shakeController.forward(
        from: 0.0); // Start the animation from the beginning
  }

  @override
  void onReady() {
    super.onReady();
    _startShakeAnimation();
    Future.delayed(
      Duration(seconds: 4),
      () => Get.toNamed(AppRoutes.onBoarding),
    );
  }
}
