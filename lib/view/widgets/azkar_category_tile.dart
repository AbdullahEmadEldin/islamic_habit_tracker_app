import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/data/models/azkar_category.dart';

class AzkarCategoryTile extends StatelessWidget {
  final ZikrCategory zikrCategory;
  final Color tileColor;
  const AzkarCategoryTile(
      {Key? key, required this.zikrCategory, required this.tileColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: tileColor),
        child: Center(
          child: Text(
            zikrCategory.category,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
