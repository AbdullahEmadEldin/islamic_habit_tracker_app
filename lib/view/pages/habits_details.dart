// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/core/helpers/extensions.dart';

import 'package:islamic_habit_tracker/data/models/habit.dart';

import 'package:islamic_habit_tracker/logic/cubits/delete_habits_cubits/delete_habits_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/tracking_calendar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../core/localization/local_keys.dart';

class HabitsDetails extends StatelessWidget {
  final Habit mainHabit;
  const HabitsDetails({
    Key? key,
    required this.mainHabit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool historyExsist = mainHabit.trakingDates!.isNotEmpty;
    String startingDate = historyExsist
        ? '${mainHabit.trakingDates!.first.date.day}-${mainHabit.trakingDates!.first.date.month}-${mainHabit.trakingDates!.first.date.year}'
        : '';

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  mainHabit.habitName,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocalKeys.trackHabit.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    _ensureDeleteHabitDialog(context);
                  },
                  child: Text(
                    LocalKeys.deleteHabit.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            TrackingCalender(mainHabit: mainHabit),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocalKeys.statistics.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${LocalKeys.habitStartingDate.tr()} $startingDate",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                _colorsIndicating(context),
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${LocalKeys.acheivementPercent.tr()} ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${LocalKeys.streak.tr()}:  ${_calStreakDays().toInt()}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 30,
                      percent: _calculateDoneHabitPercent(),
                      center: Text(
                        historyExsist
                            ? '${(_calculateDoneHabitPercent() * 100).ceil()}%'
                            : '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      progressColor: _calculateDoneHabitPercent() < 0.5
                          ? const Color.fromARGB(255, 212, 66, 56)
                          : _calculateDoneHabitPercent() < 0.7
                              ? const Color.fromARGB(255, 255, 208, 0)
                              : context.colorScheme.primary,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future<dynamic> _ensureDeleteHabitDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            LocalKeys.doYouWantRemoveHabit.tr(),
            style: Theme.of(dialogContext).textTheme.displayMedium,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                BlocProvider.of<DeleteHabitsCubit>(context)
                    .deleteHabit(mainHabit);
                Navigator.of(dialogContext).pop(); // Pop from the dialog
                Navigator.of(context).pop();
              },
              child: Text(LocalKeys.yes.tr())),
          TextButton(
              onPressed: () {
                dialogContext.pop();
              },
              child: Text(LocalKeys.no.tr()))
        ],
      ),
    );
  }

  Widget _colorsIndicating(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              color: Colors.green,
            ),
            const SizedBox(width: 4),
            Text(LocalKeys.doneLabelColor.tr())
          ],
        ),
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              color: Colors.redAccent,
            ),
            const SizedBox(width: 4),
            Text(LocalKeys.notAchieved.tr())
          ],
        ),
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              color: const Color.fromARGB(255, 206, 202, 202).withOpacity(0.5),
            ),
            const SizedBox(width: 4),
            Text(LocalKeys.notSartingYet.tr())
          ],
        ),
      ],
    );
  }

  double _calculateDoneHabitPercent() {
    int doneDays = 0;
    for (int i = 0; i < mainHabit.trakingDates!.length; i++) {
      if (mainHabit.trakingDates![i].done) {
        doneDays++;
      }
    }
    double percent = doneDays / mainHabit.trakingDates!.length;
    return percent;
  }

  int _calStreakDays() {
    int streak = 0;
    for (int i = 0; i < mainHabit.trakingDates!.length; i++) {
      if (mainHabit.trakingDates![i].done == false) break;
      if (mainHabit.trakingDates![i].done) streak++;
    }
    return streak;
  }
}
