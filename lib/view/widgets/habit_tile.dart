import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/helpers.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/logic/cubits/habit_cubit.dart';
import 'package:islamic_habit_tracker/view/pages/habits_details.dart';
import 'package:islamic_habit_tracker/view/widgets/empty_habit.dart';

class HabitTile extends StatefulWidget {
  final List<Habit> habits;
  const HabitTile({Key? key, required this.habits}) : super(key: key);

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HabitsCubit>(context).getHabits();
    return BlocBuilder<HabitsCubit, HabitsState>(
      builder: (context, state) {
        print('Reeeeeeebuiled');
        if (state is SucessHabits) {
          if (state.habits.isEmpty) {
            return const EmptyHabit();
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.habits.length,
              itemBuilder: (context, i) {
                DateTime now = DateTime.now();
                DateTime dateOnly = DateTime(now.year, now.month, now.day);
                DateTime perviousDate =
                    dateOnly.subtract(const Duration(minutes: 5));
                bool checkBoxBool = false;

                ///implement Saving done with false automatically at 12.00 am
                Timer(Helpers.getNextMidnightRemainingDuration(), () {
                  TrackDate date = TrackDate(date: perviousDate, done: true);
                  BlocProvider.of<HabitsCubit>(context)
                      .addTrackDate(state.habits[i], date);
                });

                ///fetching checkBox bool from database
                var datess = state.habits[i].trakingDates;
                if (datess != null && datess.isNotEmpty) {
                  for (int i = 0; i < datess.length; i++) {
                    if (dateOnly == datess[i].date) {
                      checkBoxBool = datess[i].done;
                    }
                  }
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HabitsDetails(mainHabit: state.habits[i]),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              checkBoxBool ? Colors.transparent : Colors.grey),
                      borderRadius: BorderRadius.circular(16),
                      color: checkBoxBool
                          ? const Color.fromARGB(255, 184, 176, 233)
                              .withOpacity(0.3)
                          : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.habits[i].habitName,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  decoration: checkBoxBool
                                      ? TextDecoration.lineThrough
                                      : null),
                        ),
                        Checkbox(
                            fillColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.deepPurple;
                              } else {
                                return Colors.transparent;
                              }
                            }),
                            shape: const CircleBorder(),
                            side: const BorderSide(
                                color: Colors.deepPurple, width: 2),
                            value: checkBoxBool,
                            onChanged: (check) {
                              if (checkBoxBool == false) {
                                TrackDate date =
                                    TrackDate(date: dateOnly, done: true);
                                BlocProvider.of<HabitsCubit>(context)
                                    .addTrackDate(state.habits[i], date);
                                setState(() {});
                              }
                            })
                      ],
                    ),
                  ),
                );
              });
        }
        return Text('55555555555555 state ${state.toString()}');
      },
    );
  }
}
