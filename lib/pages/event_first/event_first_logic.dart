import 'package:event_calendar/db_event/db_event.dart';
import 'package:event_calendar/db_event/event_entity.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class EventFirstLogic extends GetxController {
  DBEvent dbEvent = Get.find<DBEvent>();

  CalendarFormat calendarFormat = CalendarFormat.month;

  var list = <EventEntity>[];
  var currentDate = DateTime.now();

  void getData() async {
    final result = await dbEvent.getEventAllData();
    final now = currentDate;
    list = result
        .where((element) =>
            element.eventTime.year == now.year &&
            element.eventTime.month == now.month &&
            element.eventTime.day == now.day)
        .toList();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
