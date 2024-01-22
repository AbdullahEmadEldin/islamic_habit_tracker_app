// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:islamic_habit_tracker/data/models/tracking_date.dart';

class Habit {
  final int? id;
  final String habitName;

  ///null check is handled
  List<TrackDate>? trakingDates;
  Habit({
    this.id,
    required this.habitName,
    this.trakingDates,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'habitName': habitName,
      'trakingDates': trakingDates,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
        id: map['id'] != null ? map['id'] as int : null,
        habitName: map['habitName'] as String,
        trakingDates: map['trackingDates']);
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) =>
      Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Habit(id: $id, habitName: $habitName, trakingDates: $trakingDates)';
}
