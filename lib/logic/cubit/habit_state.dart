part of 'habit_cubit.dart';

@immutable
sealed class HabitsState {}

final class HabitInitial extends HabitsState {}

final class SucessHabits extends HabitsState {
  final List<Habit> habits;

  SucessHabits({required this.habits});
}

final class SucessDatesForOneHabit extends HabitsState {
  final List<TrackDate> dates;

  SucessDatesForOneHabit({required this.dates});
}
