import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/localization/localization_manager.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';

class HorizontalDatePicker extends StatelessWidget {
  const HorizontalDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return EasyInfiniteDateTimeLine(
      showTimelineHeader: false,
      locale: locator.get<LocalizationManager>().isArabic() ? 'ar' : 'en',
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      focusDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 1)),
      activeColor: AppColors.primary.withOpacity(0.7),
      dayProps: EasyDayProps(
        landScapeMode: true,
        width: size.width / 6,
        height: size.height / 7,
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          borderRadius: 32.0,
          dayStrStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
        inactiveDayStyle: DayStyle(
          borderRadius: 32.0,
          dayStrStyle: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.grey),
        ),
      ),
    );
  }
}
