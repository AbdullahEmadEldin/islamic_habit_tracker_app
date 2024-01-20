// ignore_for_file: avoid_print

import 'dart:convert';

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
    } catch (e) {
      print('INside Cubbbbbit: rerror createHabit ${e.toString()}');
    }
  }

  void addTrackDate(Habit habit, TrackDate date) async {
    try {} catch (e) {
      print('INside Cubbbbbit: rerror adding datte ${e.toString()}');
    }
  }

  void getHabits() async {
    try {
      List<Map<String, dynamic>> mapObj =
          await db.readData("SELECT * FROM '${db.habitTable}'");
      List<Habit> habits = mapObj.map((e) => Habit.fromMap(e)).toList();
      emit(SucessHabits(habits: habits));
    } catch (e) {
      print('INside Cubbbbbit: rerror abstractHabits ${e.toString()}');
    }
  }

  void deleteHabit(Habit habit) {
    try {} catch (e) {
      print('INside Cubbbbbit: rerror delete habit ${e.toString()}');
    }
  }

  void deleteAllHabit() async {
    try {
      await db.deleteCompleteDatabase();
    } catch (e) {
      print('INside Cubbbbbit: rerror rmove all habits ${e.toString()}');
    }
  }
}
// [
//    {
//      id: 1, 
//      habitName: غغغغ, 
//      trackingDates: 
//          [
//           [
//             [
//               [], 
//               {"id":null,"date":1705615200000,"done":true}
//             ], 
//             {"id":null,"date":1705615200000,"done":true}
//           ], 
//           {"id":null,"date":1705615200000,"done":true}
//         ]
//     }, 
//     {
//       id: 2, 
//       habitName: هلااااا, 
//       trackingDates: 
//         []
//       }
// ]