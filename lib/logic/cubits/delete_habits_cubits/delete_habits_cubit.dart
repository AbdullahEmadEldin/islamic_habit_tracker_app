import 'package:bloc/bloc.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';
import 'package:meta/meta.dart';

part 'delete_habits_state.dart';

class DeleteHabitsCubit extends Cubit<DeleteHabitsState> {
  final HabitDB db = HabitDB();
  DeleteHabitsCubit() : super(DeleteHabitsInitial());

  /// Delete single habit from habit details screen
  void deleteHabit(Habit habit) async {
    emit(DeleteAllHabitsLoading());
    try {
      await db
          .deleteData('DELETE FROM ${db.habitTable} WHERE id = ${habit.id}');
      await db
          .deleteData('DELETE FROM ${db.datesTable} WHERE id = ${habit.id}');
      print('Delteing habit with it history:: inside CCUUUBIT');
      emit(DeleteHabitsSuccess(habitId: habit.id!));
    } catch (e) {
      print('INside Cubbbbbit: rerror delete habit ${e.toString()}');
      emit(DeleteAllHabitsFailure(errorMsg: e.toString()));
    }
  }

  /// Delete all habits from settings screen
  void deleteAllHabits() async {
    try {
      await db.deleteData('DELETE FROM ${db.habitTable}');
      await db.deleteData('DELETE FROM ${db.datesTable}');
    } catch (e) {
      print('INside Cubbbbbit: rerror rmove all habits ${e.toString()}');
    }
  }
}
