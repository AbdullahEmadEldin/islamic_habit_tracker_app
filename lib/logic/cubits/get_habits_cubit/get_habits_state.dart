part of 'get_habits_cubit.dart';

@immutable
sealed class GetHabitsState {}

final class GetHabitsInitial extends GetHabitsState {}

final class GetHabitsLoading extends GetHabitsState {}

final class GetHabitsSuccess extends GetHabitsState {
  final List<Habit> habits;

  GetHabitsSuccess({required this.habits});
}

final class GetHabitsFailure extends GetHabitsState {
  final String errorMsg;

  GetHabitsFailure({required this.errorMsg});
}
