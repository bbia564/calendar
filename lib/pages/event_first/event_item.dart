import 'package:event_calendar/db_event/event_entity.dart';
import 'package:event_calendar/main.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:get/get.dart';

class EventItem extends StatelessWidget {
  const EventItem(this.list, {Key? key}) : super(key: key);
  final List<EventEntity> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        Text(
          list.first.eventTimeString,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
        ),
        const SizedBox(height: 10),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) {
              final entity = list[index];
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  Container(
                    width: 5,
                    height: 5,
                  ).decorated(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(2.5)),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    entity.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    entity.timeIntervalString,
                    style: const TextStyle(color: Color(0xff898989)),
                  )
                ].toRow(crossAxisAlignment: CrossAxisAlignment.center),
              )
                  .decorated(
                      color: const Color(0xfffafafa),
                      borderRadius: BorderRadius.circular(12))
                  .marginOnly(bottom: 10);
            })
      ].toColumn(),
    ).decorated(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xffeaeaea))).marginOnly(bottom: 10);
  }
}
