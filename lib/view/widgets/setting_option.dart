import 'package:flutter/material.dart';

class SettingOption extends StatelessWidget {
  final IconData icon;
  final String setting;
  final Widget? trailing;
  final Function() onTap;
  final bool isClickable;

  const SettingOption({
    Key? key,
    required this.icon,
    required this.setting,
    required this.onTap,
    this.trailing,
    this.isClickable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isClickable ? () => onTap() : null,
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
