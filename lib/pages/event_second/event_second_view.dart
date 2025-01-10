import 'package:event_calendar/pages/event_first/event_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_second_logic.dart';

class EventSecondPage extends GetView<EventSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All event'),
      ),
      body: SafeArea(child: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(child: Text('No data'))
            : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return EventItem(entity);
                });
      })),
    );
  }
}
