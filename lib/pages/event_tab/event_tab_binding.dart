import 'package:event_calendar/pages/event_first/event_first_logic.dart';
import 'package:event_calendar/pages/event_second/event_second_logic.dart';
import 'package:get/get.dart';

import '../event_third/event_third_logic.dart';
import 'event_tab_logic.dart';

class EventTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventTabLogic());
    Get.lazyPut(() => EventFirstLogic());
    Get.lazyPut(() => EventSecondLogic());
    Get.lazyPut(() => EventThirdLogic());
  }
}
