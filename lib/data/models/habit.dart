import 'package:objectbox/objectbox.dart';

@Entity()
class Habit {
  @Id()
  int id;
  final String habitName;
  final dates = ToMany<TrackDate>();

  Habit({
    this.id = 0,
    required this.habitName,
  });
}

@Entity()
class TrackDate {
  @Id()
  int id = 0;
  final DateTime date;
  final habit = ToOne<Habit>();

  TrackDate({
    required this.date,
  });
}
