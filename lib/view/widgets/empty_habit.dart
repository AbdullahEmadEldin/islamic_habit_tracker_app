import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

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
          S.of(context).emptyHabits,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.deepPurple),
        ),
        Text(
          S.of(context).addHabit,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.deepPurple),
        )
      ],
    );
  }
}
