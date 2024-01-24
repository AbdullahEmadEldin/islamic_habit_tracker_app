import 'package:flutter/material.dart';

class SettingOption extends StatelessWidget {
  final IconData icon;
  final String setting;
  final Widget? trailing;
  final Function() ontap;
  const SettingOption(
      {Key? key,
      required this.icon,
      required this.setting,
      this.trailing,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            setting,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white),
          ),
          const Spacer(
            flex: 1,
          ),
          trailing ?? const SizedBox(),
        ],
      ),
    );
  }
}
