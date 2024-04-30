import 'package:bloc/bloc.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';
import 'package:meta/meta.dart';

part 'get_habits_state.dart';

class GetHabitsCubit extends Cubit<GetHabitsState> {
  final HabitDB db = HabitDB();
  GetHabitsCubit() : super(GetHabitsInitial());
  Future<void> getHabits() async {
    emit(GetHabitsLoading());
    try {
      ///getting habits without dates  from database
      List<Map<String, dynamic>> habitsMap =
          await db.readData('SELECT * FROM ${db.habitTable}');
      List<Habit> habits = habitsMap
          .map(
            (e) => Habit.fromMap(e),
          )
          .toList();

      ///getting dates from database && merging it to it's habit.
      for (int i = 0; i < habits.length; i++) {
        List<Map<String, dynamic>> datesMap = await db.readData(
            'SELECT * FROM ${db.datesTable} WHERE id = ${habits[i].id}');
        List<TrackDate> dates = datesMap
            .map(
              (e) => TrackDate.fromMap(e),
            )
            .toList();
        habits[i].trakingDates = [];
        habits[i].trakingDates!.addAll(dates);
      }
      print('Success Response +++++++++:: $habits');
      emit(GetHabitsSuccess(habits: habits));
    } catch (e) {
      print('error in cubit getting habits :: ${e.toString()}');
      emit(GetHabitsFailure(errorMsg: e.toString()));
    }
  }
}
