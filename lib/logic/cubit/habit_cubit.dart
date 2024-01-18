// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:meta/meta.dart';

part 'habit_state.dart';

class HabitsCubit extends Cubit<HabitsState> {
  //final HabitsRepository repository;
  HabitsCubit() : super(HabitInitial());

  void createHabit(Habit habit) {
    // try {
    //   repository.createHabit(habit);
    // } catch (e) {
    //   print('INside Cubbbbbit: rerror createHabit ${e.toString()}');
    // }
  }

  void getHabits() {
    // try {
    //   final habits = repository.getAllHabits();
    //   emit(SucessHabits(habits: habits));
    // } catch (e) {
    //   print('INside Cubbbbbit: rerror abstractHabits ${e.toString()}');
    // }
  }

  void deleteHabit(Habit habit) {
    // try {
    //   repository.removeHabit(habit.id);
    // } catch (e) {
    //   print('INside Cubbbbbit: rerror delete habit ${e.toString()}');
    // }
  }

  void deleteAllHabit() {
    // try {
    //   repository.removeAllHabits();
    // } catch (e) {
    //   print('INside Cubbbbbit: rerror rmove all habits ${e.toString()}');
    // }
  }
}
