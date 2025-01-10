import 'package:get/get.dart';

import 'event_third_logic.dart';

class EventThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventThirdLogic());
  }
}
