import 'package:get/get.dart';

import '../../modules/auth/presentation/manager/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
