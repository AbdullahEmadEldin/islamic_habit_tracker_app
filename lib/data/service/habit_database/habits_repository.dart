import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/main.dart';

class HabitsRepository {
  final _habitBox = mainObjectbox.store.box<Habit>();

  void createHabit(Habit habit) {
    _habitBox.put(habit);
    print('habit created----------------------');
  }

  void addTrackDate(TrackDate date) {}

  List<Habit> getAllHabits() {
    print('getting dataaaaaaaaaaaaaaaaaa REPOOOO ${_habitBox.getAll().length}');
    return _habitBox.getAll();
  }

  void removeHabit(int id) {
    print('REPOOOO removess');
    _habitBox.remove(id);
  }

  void removeAllHabits() {
    _habitBox.removeAll();
  }
}
