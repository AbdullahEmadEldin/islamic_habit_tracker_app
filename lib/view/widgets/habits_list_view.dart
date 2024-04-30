import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/logic/cubits/delete_habits_cubits/delete_habits_cubit.dart';
import 'package:islamic_habit_tracker/logic/cubits/get_habits_cubit/get_habits_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/empty_habit.dart';
import 'package:islamic_habit_tracker/view/widgets/habit_tile.dart';

class HabitsListView extends StatefulWidget {
  const HabitsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<HabitsListView> createState() => _HabitsListViewState();
}

class _HabitsListViewState extends State<HabitsListView> {
  late GetHabitsCubit getHabitsCubit;

  @override
  void initState() {
    super.initState();
    getHabitsCubit = BlocProvider.of<GetHabitsCubit>(context);
    getHabitsCubit.getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHabitsCubit, GetHabitsState>(
      builder: (context, state) {
        print('Reeeeeeebuiled ========= ');
        if (state is GetHabitsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetHabitsSuccess) {
          final habits = state.habits;
          if (state.habits.isEmpty) {
            return const EmptyHabit();
          }

          /// This bloc listener for updating the UI in home screen,
          /// after deleting a habit inside the Habit details screen.
          return BlocListener<DeleteHabitsCubit, DeleteHabitsState>(
            listener: (context, deleteState) {
              if (deleteState is DeleteHabitsSuccess) {
                habits.removeWhere(
                    (element) => element.id == deleteState.habitId);
                setState(() {});
              }
            },
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: habits.length,
                itemBuilder: (context, i) {
                  // DateTime now = DateTime.now();
                  // DateTime dateOnly = DateTime(now.year, now.month, now.day);
                  // DateTime perviousDate =
                  //     dateOnly.subtract(const Duration(minutes: 5));

                  ///implement Saving done with false automatically at 12.00 am
                  // Timer(Helpers.getNextMidnightRemainingDuration(), () {
                  //   TrackDate date = TrackDate(date: perviousDate, done: true);
                  //   BlocProvider.of<HabitsCubit>(context)
                  //       .addTrackDate(state.habits[i], date);
                  // });

                  return HabitTileItem(habit: habits[i]);
                }),
          );
        }
        return Center(child: Text('55555555555555 state ${state.toString()}'));
      },
    );
  }
}
