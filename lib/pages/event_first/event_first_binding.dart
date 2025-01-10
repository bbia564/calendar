import 'package:get/get.dart';

import 'event_first_logic.dart';

class EventFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventFirstLogic());
  }
}
