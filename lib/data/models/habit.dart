// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Habit {
  final int? id;
  final String habitName;

  Habit({
    this.id,
    required this.habitName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'habitName': habitName,
    };
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      id: map['id'] != null ? map['id'] as int : null,
      habitName: map['habitName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) =>
      Habit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Habit other) {
    if (identical(this, other)) return true;

    return other.id == id && other.habitName == habitName;
  }
}
