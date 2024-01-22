// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TrackDate {
  final int? id;
  final DateTime date;
  final bool done;

  TrackDate({
    this.id,
    required this.date,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'done': done,
    };
  }

  factory TrackDate.fromMap(Map<String, dynamic> map) {
    return TrackDate(
      id: map['id'] as int,
      date: DateTime.parse(map['date']),
      done: map['done'] == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TrackDate.fromJson(String source) =>
      TrackDate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TrackDate(id: $id, date: $date, done: $done)';
}
