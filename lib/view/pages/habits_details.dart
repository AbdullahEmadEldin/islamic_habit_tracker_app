// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';

import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/logic/cubit/habit_cubit.dart';

class HabitsDetails extends StatelessWidget {
  final Habit mainHabit;
  const HabitsDetails({
    Key? key,
    required this.mainHabit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              dayBuilder: ({
                required date,
                decoration,
                isDisabled,
                isSelected,
                isToday,
                textStyle,
              }) {
                Color dayColor = Colors.grey.withOpacity(0.5);
                Color borderDayColor = Colors.grey;
                for (var datee in mainHabit.trakingDates!) {
                  if (date == datee.date) {
                    datee.done
                        ? (
                            dayColor = const Color.fromARGB(255, 51, 128, 53)
                                .withOpacity(0.4),
                            borderDayColor =
                                const Color.fromARGB(255, 86, 241, 91)
                          )
                        : (
                            dayColor = const Color.fromARGB(255, 167, 37, 28)
                                .withOpacity(0.4),
                            borderDayColor =
                                const Color.fromARGB(255, 252, 41, 25)
                          );
                  }
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: borderDayColor),
                        borderRadius: BorderRadius.circular(16),
                        color: dayColor),
                    child: Center(
                        child: Text(
                      date.day.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    )),
                  ),
                );
              },
            ),
            value: [],
          )
        ],
      )),
    );
  }
}

Widget? Function(
    {required DateTime date,
    BoxDecoration? decoration,
    bool? isDisabled,
    bool? isSelected,
    bool? isToday,
    TextStyle? textStyle})? dayBuilder;
