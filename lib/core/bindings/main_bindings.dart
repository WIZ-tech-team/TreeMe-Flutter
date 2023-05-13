import 'package:get/get.dart';

import '../../modules/splash/presentation/manager/splash_controller.dart';

class MainBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
