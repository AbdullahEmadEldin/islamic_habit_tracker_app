import 'package:bloc/bloc.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';
import 'package:meta/meta.dart';

part 'create_habit_state.dart';

class CreateHabitCubit extends Cubit<CreateHabitState> {
  final HabitDB db = HabitDB();
  CreateHabitCubit() : super(CreateHabitInitial());

  Future<void> createHabit(Habit habit) async {
    emit(CreateHabitLoading());
    try {
      await db.createData(
          " INSERT INTO ${db.habitTable} ('habitName') VALUES ('${habit.habitName}')");
      addTrackDate(habit, TrackDate(date: DateTime.now(), done: false));
      emit(CreateHabitSuccess());
    } catch (e) {
      print('INside Create Cubit: error::::  createHabit ${e.toString()}');
      emit(CreateHabitFailure());
    }
  }

  void addTrackDate(Habit habit, TrackDate date) async {
    try {
      await db.createData('''
       INSERT INTO "${db.datesTable}" ("id", "date", "done")
       VALUES (${habit.id}, '${date.date}', ${date.done ? 1 : 0})
    ''');
    } catch (e) {
      print('Create Cubit::: error:: ${e.toString()}');
    }
  }
}
