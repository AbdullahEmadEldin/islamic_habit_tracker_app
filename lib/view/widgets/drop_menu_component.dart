import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/localization/local_keys.dart';

class PopMenuComponent extends StatelessWidget {
  const PopMenuComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      initialValue: LocalKeys.arabic.tr(),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: LocalKeys.arabic.tr(),
          child: Text(LocalKeys.arabic.tr()),
        ),
        // PopupMenuItem(
        //   value: LocalKeys.endlish.tr(),
        //   child: Text(LocalKeys.endlish.tr()),
        // ),
      ],
    );
  }
}
