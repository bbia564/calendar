import 'dart:convert';

import 'package:event_calendar/db_event/event_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBEvent extends GetxService {
  late Database dbBase;

  Future<DBEvent> init() async {
    await createEventDB();
    return this;
  }

  createEventDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'event.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createEventTable(db);
        });
  }

  createEventTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS event (id INTEGER PRIMARY KEY, createdTime TEXT, eventTime TEXT, name TEXT, startTime TEXT, endTime TEXT)');
  }

  insertEvent(EventEntity entity) async {
    final id = await dbBase.insert('event', {
      'createdTime': entity.createdTime.toIso8601String(),
      'eventTime': entity.eventTime.toIso8601String(),
      'name': entity.name,
      'startTime': entity.startTime.toIso8601String(),
      'endTime': entity.endTime.toIso8601String(),
    });
    return id;
  }

  cleanEventData() async {
    await dbBase.delete('event');
  }

  Future<List<EventEntity>> getEventAllData() async {
    var result = await dbBase.query('event', orderBy: 'createdTime DESC');
    return result.map((e) => EventEntity.fromJson(e)).toList();
  }

  Future<List<List<EventEntity>>> getEventsGroupedByDate() async {

    final List<Map<String, dynamic>> maps = await dbBase.rawQuery('''
      SELECT 
        strftime('%Y-%m-%d', eventTime) AS eventDate, 
        id, createdTime, eventTime, name, startTime, endTime
      FROM event
      ORDER BY eventDate
    ''');

    Map<String, List<EventEntity>> groupedEvents = {};

    for (var map in maps) {
      String eventDate = map['eventDate'];


      EventEntity event = EventEntity.fromJson(map);


      if (!groupedEvents.containsKey(eventDate)) {
        groupedEvents[eventDate] = [];
      }
      groupedEvents[eventDate]!.add(event);
    }


    return groupedEvents.values.toList();
  }
}
