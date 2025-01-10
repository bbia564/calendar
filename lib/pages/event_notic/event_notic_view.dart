import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_notic_logic.dart';

class EventNoticView extends GetView<PageLogic> {
  const EventNoticView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.hagenes.value
              ? const CircularProgressIndicator(color: Colors.purple)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.gyisafk();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
