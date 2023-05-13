

import 'package:get/get.dart';

import '../../modules/create_event/presentation/manager/create_event_controller.dart';

class CreateEventBindings implements Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => CreateEventController());
  }

}