part of 'create_habit_cubit.dart';

@immutable
sealed class CreateHabitState {}

final class CreateHabitInitial extends CreateHabitState {}

final class CreateHabitLoading extends CreateHabitState {}

final class CreateHabitSuccess extends CreateHabitState {}

final class CreateHabitFailure extends CreateHabitState {}
