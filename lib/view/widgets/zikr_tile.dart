import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/data/models/single_zikr.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

class ZikrTile extends StatelessWidget {
  final Zikr duaa;
  final bool isFontScaled;
  const ZikrTile({
    Key? key,
    required this.duaa,
    required this.isFontScaled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: lContainerColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              duaa.text,
              style: isFontScaled
                  ? Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontFamily: 'arabic_typesetting',
                      fontWeight: FontWeight.w300)
                  : Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontFamily: 'arabic_typesetting',
                      fontWeight: FontWeight.w300),
            ),
            Text("${S.of(context).count} ${duaa.count}",
                style: Theme.of(context).textTheme.displaySmall)
          ],
        ),
      ),
    );
  }
}
