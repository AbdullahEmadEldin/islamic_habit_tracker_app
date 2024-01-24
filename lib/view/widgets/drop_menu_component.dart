import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

class PopMenuComponent extends StatelessWidget {
  const PopMenuComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      initialValue: S.of(context).arabic,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: S.of(context).arabic,
          child: Text(S.of(context).arabic),
        ),
        // PopupMenuItem(
        //   value: S.of(context).endlish,
        //   child: Text(S.of(context).endlish),
        // ),
      ],
    );
  }
}
