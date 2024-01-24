// ignore_for_file: avoid_print, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/data/service/habit_database/habits_db.dart';

part 'habit_state.dart';

class HabitsCubit extends Cubit<HabitsState> {
  final HabitDB db;
  HabitsCubit({required this.db}) : super(HabitInitial());

  void createHabit(Habit habit) async {
    try {
      await db.createData(
          " INSERT INTO ${db.habitTable} ('habitName') VALUES ('${habit.habitName}')");
      addTrackDate(habit, TrackDate(date: DateTime.now(), done: true));
    } catch (e) {
      print('INside Cubbbbbit: rerror createHabit ${e.toString()}');
    }
  }

  void addTrackDate(Habit habit, TrackDate date) async {
    try {
      await db.createData('''
       INSERT INTO "${db.datesTable}" ("id", "date", "done")
       VALUES (${habit.id}, '${date.date}', ${date.done ? 1 : 0})
    ''');
    } catch (e) {
      print('INside Cubbbbbit: rerror adding datte ${e.toString()}');
    }
  }

  void getHabits() async {
    try {
      List<Map<String, dynamic>> habitsMap =
          await db.readData('SELECT * FROM ${db.habitTable}');
      List<Habit> habbits = habitsMap
          .map(
            (e) => Habit.fromMap(e),
          )
          .toList();

      for (int i = 0; i < habbits.length; i++) {
        List<Map<String, dynamic>> datesMap = await db.readData(
            'SELECT * FROM ${db.datesTable} WHERE id = ${habbits[i].id}');
        List<TrackDate> dates = datesMap
            .map(
              (e) => TrackDate.fromMap(e),
            )
            .toList();
        habbits[i].trakingDates = [];
        habbits[i].trakingDates!.addAll(dates);
      }
      print('COOOOOOOOOOOOOOOOOOOOOOOmplete resssponse:: $habbits');
      emit(SucessHabits(habits: habbits));
    } catch (e) {
      print('error in cubit getting habbits :: ${e.toString()}');
    }
  }

  void deleteHabit(Habit habit) async {
    try {
      await db
          .deleteData('DELETE FROM ${db.habitTable} WHERE id = ${habit.id}');
      await db
          .deleteData('DELETE FROM ${db.datesTable} WHERE id = ${habit.id}');
      print('Delteing habit with it history:: inside CCUUUBIT');
    } catch (e) {
      print('INside Cubbbbbit: rerror delete habit ${e.toString()}');
    }
  }

  void deleteAllHabits() async {
    try {
      await db.deleteData('DELETE FROM ${db.habitTable}');
      await db.deleteData('DELETE FROM ${db.datesTable}');
    } catch (e) {
      print('INside Cubbbbbit: rerror rmove all habits ${e.toString()}');
    }
  }
}
