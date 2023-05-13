import 'package:get/get.dart';

import '../../modules/auth/presentation/manager/sign_up_controller.dart';

class SignUpBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
