// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';

import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/logic/cubits/delete_habits_cubits/delete_habits_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/tracking_calendar.dart';
import 'package:islamic_habit_tracker/view/widgets/tracking_colors-guide.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitsDetails extends StatefulWidget {
  final Habit mainHabit;
  const HabitsDetails({
    Key? key,
    required this.mainHabit,
  }) : super(key: key);

  @override
  State<HabitsDetails> createState() => _HabitsDetailsState();
}

class _HabitsDetailsState extends State<HabitsDetails> {
  late List<TrackDate> habitDates;

  bool historyExsist = false;
  DateTime? startingDate;

  @override
  void initState() {
    historyExsist = widget.mainHabit.trakingDates!.isNotEmpty;
    startingDate = historyExsist!
        ? widget.mainHabit.trakingDates!.first.date.toLocal()
        : null;
    habitDates = historyExsist ? widget.mainHabit.trakingDates! : [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  widget.mainHabit.habitName,
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
                  S.of(context).trackHabit,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    _ensureDeleteHabitDialog(context);
                  },
                  icon: Icon(Icons.delete, color: AppColors.primary),
                )
              ],
            ),
            TrackingCalender(
                doneDates: habitDates.map((e) => e.date).toList(),
                // widget.mainHabit.trakingDates!.map((e) => e.date).toList(),
                notDoneDates: _calFalseDates()),
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
                      "${S.of(context).habitStartingDate} ${startingDate?.day ?? ''}-${startingDate?.month ?? ''}-${startingDate?.year ?? ''}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const TrackingColorsGuide(),
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
                          '${S.of(context).AcheivementPercent} ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '${S.of(context).streak}:  ${_calStreakDays().toInt()}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 30,
                      percent: _calculateDoneHabitPercent(),
                      center: Text(
                        historyExsist!
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
            S.of(dialogContext).doYouWantRemoveHabit,
            style: Theme.of(dialogContext).textTheme.displayMedium,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                BlocProvider.of<DeleteHabitsCubit>(context)
                    .deleteHabit(widget.mainHabit);
                Navigator.of(dialogContext).pop(); // Pop from the dialog
                Navigator.of(context).pop();
              },
              child: Text(S.of(dialogContext).Yes)),
          TextButton(
              onPressed: () {
                dialogContext.pop();
              },
              child: Text(S.of(dialogContext).NO))
        ],
      ),
    );
  }

  double _calculateDoneHabitPercent() {
    if (habitDates.isEmpty) return 0;
    final List<DateTime> allDates =
        habitDates.map((e) => e.date).toList() + _calFalseDates();

    double percent = habitDates.length / allDates.length;
    return percent;
  }

  int _calStreakDays() {
    List<int> streaks = [];
    if (habitDates.isEmpty || streaks.isEmpty) return 0;

    /// initialized with 1 to count the first day in the streak
    int streak = 1;
    for (int i = 0; i < habitDates.length; i++) {
      // i != 0 to avoid invalid index error.
      if (i != 0) {
        if (habitDates[i].date.difference(habitDates[i - 1].date).inDays == 1) {
          streak++;

          /// This condition to include the last streak in the streaks list.
          if (i == habitDates.length - 1) {
            streaks.add(streak);
            print('STREAKS ::::: $streaks');
          }
        } else if (habitDates[i]
                .date
                .difference(habitDates[i - 1].date)
                .inDays !=
            1) {
          print('habitDates after remove calculates streak ----> $habitDates');

          /// this will include all the streaks in the streaks list
          /// and then sorting then return the last streak (as it will be the longest one).
          streaks.add(streak);
          print('STREAKS ::::: $streaks');
          streak = 1;
        }
      }
    }
    streaks.sort();
    return streaks.last;
  }

  List<DateTime> _calFalseDates() {
    if (habitDates.isEmpty) return [];

    /// the list of dates that coming from database will be the DONE dates.
    /// we will calculate from the starting date of the habit to the current date
    /// if any date in not in the done list it will be false.
    ///
    List<DateTime> falseDates = [];

    for (DateTime date = habitDates.first.date; // starting date
        /// this condition to check if the date is before yesterday...
        /// WHY noy today ? --> because user may mark it as done at any time of the remaining day.
        /// and we don't want to include that date in the false dates list until the day ends.
        date.isBefore(DateTime.now().subtract(const Duration(days: 1))) &&

            /// if there is one item in the list the above condition will ignore it and will make it false.
            habitDates.length != 1;

        /// This will increment the date until the 2nd condition is false then it will exit.
        date = date.add(const Duration(days: 1))) {
      if (!habitDates.contains(date)) {
        falseDates.add(date);
      }
    }
    return falseDates;
  }
}

List<DateTime> test = [
  DateTime(2024, 8, 5),
  DateTime(2024, 8, 6),
  DateTime(2024, 8, 7),
  DateTime(2024, 8, 10),
  DateTime(2024, 8, 15),
  DateTime(2024, 8, 19),
  DateTime(2024, 8, 21),
  DateTime(2024, 8, 22),
  DateTime(2024, 8, 24),
  DateTime(2024, 8, 25),
  DateTime(2024, 8, 26),
  DateTime(2024, 8, 27),
  DateTime(2024, 8, 28),
];
