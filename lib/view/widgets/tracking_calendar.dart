import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';

class TrackingCalender extends StatelessWidget {
  final List<DateTime> doneDates;
  final List<DateTime> notDoneDates;
  const TrackingCalender({
    super.key,
    required this.doneDates,
    required this.notDoneDates,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        dayBuilder: ({
          required date,
          decoration,
          isDisabled,
          isSelected,
          isToday,
          textStyle,
        }) {
          Color dayColor =
              const Color.fromARGB(255, 206, 202, 202).withOpacity(0.5);
          Color borderDayColor =
              const Color.fromARGB(255, 206, 202, 202).withOpacity(0.5);
          for (var doneDate in doneDates) {
            if (date == doneDate) {
              dayColor = AppColors.doneDayColor;
              borderDayColor = AppColors.doneDayborderColor;

              //  (
              //     dayColor = AppColors.falseDayColor,
              //     borderDayColor = AppColors.falseDayborderColor,
              //   );
            }
          }
          for (var notDoneDate in notDoneDates) {
            if (date == notDoneDate) {
              dayColor = AppColors.falseDayColor;
              borderDayColor = AppColors.falseDayborderColor;
            }
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
      value: const [],
    );
  }
}
