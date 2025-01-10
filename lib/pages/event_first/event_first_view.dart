import 'package:event_calendar/main.dart';
import 'package:event_calendar/pages/event_first/event_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event_first_logic.dart';

class EventFirstPage extends GetView<EventFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Calendar'),
        actions: [
          Icon(
            Icons.add_circle,
            size: 30,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/eventAdd')?.then((_) {
              controller.getData();
            });
          })
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<EventFirstLogic>(
                init: EventFirstLogic(),
                builder: (_) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: <Widget>[
                      TableCalendar(
                        firstDay: DateTime.utc(2020, 10, 16),
                        lastDay: DateTime.utc(2050, 3, 14),
                        focusedDay: DateTime.now(),
                        calendarFormat: controller.calendarFormat,
                        onFormatChanged: (format) {
                          if (controller.calendarFormat != format) {
                            controller.calendarFormat = format;
                            controller.update();
                          }
                        },
                        currentDay: controller.currentDate,
                        calendarStyle: CalendarStyle(
                          todayDecoration: BoxDecoration(
                              color: primaryColor, shape: BoxShape.circle),
                        ),
                        onDaySelected: (selectedDay, focusedDay) {
                          controller.currentDate = selectedDay;
                          controller.update();
                          controller.getData();
                        },
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Add event',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                          .decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25))
                          .marginSymmetric(vertical: 10)
                          .gestures(onTap: () {
                        Get.toNamed('/eventAdd')?.then((_) {
                          controller.getData();
                        });
                      }),
                      controller.list.isEmpty
                          ? const Text('No data').marginOnly(top: 30)
                          : EventItem(controller.list)
                    ].toColumn(),
                  );
                }).marginAll(15)),
      ),
    );
  }
}
