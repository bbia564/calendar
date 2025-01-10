import 'package:get/get.dart';

import 'event_add_logic.dart';

class EventAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventAddLogic());
  }
}
