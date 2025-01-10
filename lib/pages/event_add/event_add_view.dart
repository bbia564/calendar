import 'package:event_calendar/pages/event_add/event_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'event_add_logic.dart';

class EventAddPage extends GetView<EventAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add event"),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        child: GetBuilder<EventAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              const Text('Date'),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: IgnorePointer(
                  child: EventTextField(
                      value: controller.eventTimeStr,
                      hintText: 'Please select',
                      onChange: (_) {}),
                ),
              )
                  .decorated(
                      color: const Color(0xfff7f7f7),
                      borderRadius: BorderRadius.circular(8))
                  .gestures(onTap: () {
                controller.selectEventTime(context);
              }),
              const SizedBox(
                height: 10,
              ),
              const Text('Name'),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: EventTextField(
                    maxLength: 20,
                    value: controller.name,
                    onChange: (value) {
                      controller.name = value;
                    }),
              )
                  .decorated(
                      color: const Color(0xfff7f7f7),
                      borderRadius: BorderRadius.circular(8))
                  .gestures(onTap: () {
                controller.selectEventTime(context);
              }),
              const SizedBox(
                height: 10,
              ),
              <Widget>[
                Expanded(
                    child: <Widget>[
                  const Text('Start time'),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: <Widget>[
                      Expanded(
                          child: IgnorePointer(
                            child: EventTextField(
                                value: controller.startTimeStr,
                                hintText: 'Please select',
                                onChange: (_) {}),
                          )),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Colors.grey,
                      )
                    ].toRow(),
                  )
                      .decorated(
                          color: const Color(0xfff7f7f7),
                          borderRadius: BorderRadius.circular(8))
                      .gestures(onTap: () {
                    controller.selectStartEndTime(context);
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
                const SizedBox(width: 10,),
                Expanded(
                    child: <Widget>[
                      const Text('End time'),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 44,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: <Widget>[
                          Expanded(
                              child: IgnorePointer(
                                child: EventTextField(
                                    value: controller.endTimeStr,
                                    hintText: 'Please select',
                                    onChange: (_) {}),
                              )),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            size: 25,
                            color: Colors.grey,
                          )
                        ].toRow(),
                      )
                          .decorated(
                          color: const Color(0xfff7f7f7),
                          borderRadius: BorderRadius.circular(8))
                          .gestures(onTap: () {
                        controller.selectStartEndTime(context,isStart: false);
                      })
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start))
              ].toRow(),
              const SizedBox(height: 35,),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
                  .decorated(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(25)).gestures(onTap: (){
                    controller.addData();
              })
            ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
          );
        }),
      )
              .decorated(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xffeaeaea)))
              .marginAll(15)),
    );
  }
}
