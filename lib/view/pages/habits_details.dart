// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';

import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/view/widgets/setting_option.dart';
import 'package:islamic_habit_tracker/view/widgets/tracking_calendar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                mainHabit.habitName,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Text(
              S.of(context).trackHabit,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TrackingCalender(mainHabit: mainHabit),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).Statistics,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${S.of(context).habitStartingDate} $startingDate",
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
                    Text(
                      '${S.of(context).AcheivementPercent} ',
                      style: Theme.of(context).textTheme.titleMedium,
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
                              : AppColors.doneDayborderColor,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print('hhhhhhhhhhhhhhhhhhhhhhh');
              },
              child: Text('dsdsd'),
            ),
            SettingOption(
                icon: Icons.abc,
                setting: 'setting',
                ontap: () {
                  print('zffffffffft');
                })
          ],
        ),
      )),
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
              color: AppColors.doneDayColor,
            ),
            const SizedBox(width: 4),
            Text(S.of(context).doneLabelColor)
          ],
        ),
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              color: AppColors.falseDayColor,
            ),
            const SizedBox(width: 4),
            Text(S.of(context).notAchieved)
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
}
