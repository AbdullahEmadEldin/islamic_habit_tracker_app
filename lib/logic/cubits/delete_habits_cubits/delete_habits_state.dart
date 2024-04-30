part of 'delete_habits_cubit.dart';

@immutable
sealed class DeleteHabitsState {}

final class DeleteHabitsInitial extends DeleteHabitsState {}

final class DeleteHabitsLoading extends DeleteHabitsState {}

final class DeleteHabitsSuccess extends DeleteHabitsState {
  final int habitId;

  DeleteHabitsSuccess({required this.habitId});
}

final class DeleteHabitsFailure extends DeleteHabitsState {
  final String errorMsg;

  DeleteHabitsFailure({required this.errorMsg});
}

//! States for Delete All habits.
final class DeleteAllHabitsLoading extends DeleteHabitsState {}

final class DeleteAllHabitsSuccess extends DeleteHabitsState {}

final class DeleteAllHabitsFailure extends DeleteHabitsState {
  final String errorMsg;

  DeleteAllHabitsFailure({required this.errorMsg});
}
