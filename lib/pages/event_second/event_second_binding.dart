import 'package:get/get.dart';

import 'event_second_logic.dart';

class EventSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventSecondLogic());
  }
}
