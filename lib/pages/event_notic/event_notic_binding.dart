import 'package:get/get.dart';

import 'event_notic_logic.dart';

class EventNoticBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
