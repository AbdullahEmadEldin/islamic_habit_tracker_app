import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/features/azkar/data/models/single_zikr.dart';
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
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lContainerColor),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${S.of(context).count} ${duaa.count}",
                    style: Theme.of(context).textTheme.displaySmall),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: duaa.text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text(S.of(context).textCoppied),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.copy,
                      color: Color(0xff470550),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
