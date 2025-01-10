import 'package:intl/intl.dart';

class EventEntity {
  int id;
  DateTime createdTime;
  DateTime eventTime;
  String name;
  DateTime startTime;
  DateTime endTime;

  EventEntity({
    required this.id,
    required this.createdTime,
    required this.eventTime,
    required this.name,
    required this.startTime,
    required this.endTime,
  });

  factory EventEntity.fromJson(Map<String, dynamic> json) {
    return EventEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      eventTime: DateTime.parse(json['eventTime']),
      name: json['name'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'eventTime': eventTime.toIso8601String(),
      'name': name,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
    };
  }

  String get eventTimeString {
    return DateFormat('yyyy-MM-dd').format(eventTime);
  }

  String get timeIntervalString {
    return '${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}';
  }
}