import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

class TrackingColorsGuide extends StatelessWidget {
  const TrackingColorsGuide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            Text(
              S.of(context).doneLabelColor,
              style: Theme.of(context).textTheme.titleSmall,
            )
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
            Text(
              S.of(context).notAchieved,
              style: Theme.of(context).textTheme.titleSmall,
            )
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
            Text(
              S.of(context).notSartingYet,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ],
    );
  }
}
