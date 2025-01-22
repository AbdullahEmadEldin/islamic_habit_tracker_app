import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';

import '../../core/localization/local_keys.dart';

class EmptyHabit extends StatelessWidget {
  const EmptyHabit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.emptyHabits,
          opacity: const AlwaysStoppedAnimation<double>(0.3),
        ),
        const SizedBox(height: 8),
        Text(
          LocalKeys.emptyHabits.tr(),
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.deepPurple),
        ),
        Text(
          LocalKeys.addHabit.tr(),
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.deepPurple),
        )
      ],
    );
  }
}
