import 'package:event_calendar/db_event/db_event.dart';
import 'package:event_calendar/db_event/event_entity.dart';
import 'package:get/get.dart';

class EventSecondLogic extends GetxController {

  DBEvent dbEvent = Get.find<DBEvent>();

  var list = <List<EventEntity>>[].obs;

  void getData() async {
    list.value = await dbEvent.getEventsGroupedByDate();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
