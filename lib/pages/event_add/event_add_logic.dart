import 'package:event_calendar/db_event/db_event.dart';
import 'package:event_calendar/db_event/event_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventAddLogic extends GetxController {

  DBEvent dbEvent = Get.find<DBEvent>();

  DateTime? eventTime;
  String eventTimeStr = '';
  String name = '';
  DateTime? startTime;
  DateTime? endTime;
  String startTimeStr = '';
  String endTimeStr = '';

  void selectEventTime(BuildContext context) {
    DatePicker.showDatePicker(
        context, dateFormat: 'yyyy-MM-dd', onConfirm: (date, list) {
      eventTime = date;
      eventTimeStr = DateFormat('yyyy-MM-dd').format(date);
      update();
    });
  }

  void selectStartEndTime(BuildContext context, {bool isStart = true}) {
    DatePicker.showDatePicker(
        context, dateFormat: 'HH:mm', onConfirm: (date, list) {
      if (isStart) {
        if (endTime != null && date.isAfter(endTime!)) {
          Fluttertoast.showToast(
              msg: 'The start time cannot be later than the end time');
          return;
        }
        startTime = date;
        startTimeStr = DateFormat('HH:mm').format(date);
      } else {
        if (startTime != null && date.isBefore(startTime!)) {
          Fluttertoast.showToast(
              msg: 'The start time cannot be later than the end time');
          return;
        }
        endTime = date;
        endTimeStr = DateFormat('HH:mm').format(date);
      }
      update();
    });
  }

  void addData() async {
    if (eventTime == null || name.isEmpty || startTime == null ||
        endTime == null) {
      Fluttertoast.showToast(msg: 'Please fill in the required information');
      return;
    }
    await dbEvent.insertEvent(EventEntity(id: 0,
        createdTime: DateTime.now(),
        eventTime: eventTime!,
        name: name,
        startTime: startTime!,
        endTime: endTime!));
    Get.back();
  }

}
