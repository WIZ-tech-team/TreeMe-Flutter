

import 'package:get/get.dart';
import 'package:treeme/modules/my_profile/presentation/manager/my_profile_controller.dart';

class MyProfileBinding implements Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => MyProfileController());
  }

}