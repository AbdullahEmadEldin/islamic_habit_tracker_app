import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/app/azkar/data/models/azkar_category.dart';
import 'package:islamic_habit_tracker/app/azkar/view/widgets/zikr_tile.dart';

class AzkarDetails extends StatefulWidget {
  final ZikrCategory zikrCategory;
  const AzkarDetails({super.key, required this.zikrCategory});

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  bool isFontScaled = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              children: [
                _buidHeader(context),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.zikrCategory.azkar.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ZikrTile(
                        duaa: widget.zikrCategory.azkar[index],
                        isFontScaled: isFontScaled,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buidHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Text(widget.zikrCategory.category,
            style: Theme.of(context).textTheme.displayLarge!),
        IconButton(
            onPressed: () {
              setState(() {
                isFontScaled = !isFontScaled;
              });
            },
            icon: Icon(
              Icons.font_download,
              color: AppColors.lForeground,
            ))
      ],
    );
  }
}
