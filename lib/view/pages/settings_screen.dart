import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/view/widgets/drop_menu_component.dart';
import 'package:islamic_habit_tracker/view/widgets/setting_option.dart';
import 'package:islamic_habit_tracker/view/widgets/switcher.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  bool notificationON = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: size.height * 0.32,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
                color: lForeground),
          ),
          Positioned(
            top: size.height * 0.06,
            left: size.width * 0.65,
            child: _buildSettingsHerder(context),
          ),
          _setttingsOptionsBuilder(size, context),
          Positioned(
              top: size.height * 0.5,
              left: size.width / 2 - 140,
              child: Image.asset(AppAssets.settingsBanner))
        ],
      ),
    );
  }

  Positioned _setttingsOptionsBuilder(Size size, BuildContext context) {
    return Positioned(
        top: 82,
        left: size.width / 2 - 140,
        child: Container(
          height: size.height * 0.38,
          width: size.width * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: lSecondaryBackground.withOpacity(0.3)),
          child: BlurryContainer(
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SettingOption(
                    icon: Icons.notifications,
                    setting: S.of(context).notification,
                    trailing: _switchNotifications(),
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.sunny,
                    setting: S.of(context).appTheme,
                    trailing: _switchTheme(),
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.language,
                    setting: S.of(context).lang,
                    trailing: SizedBox(
                        height: size.height * 0.02, child: PopMenuComponent()),
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.mail,
                    setting: S.of(context).help,
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.error,
                    setting: S.of(context).About,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildSettingsHerder(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          S.of(context).settings,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: 8,
        ),
        Image.asset(AppAssets.settingsIcon)
      ],
    );
  }

  Divider _buildDivider() {
    return const Divider(
      height: 25,
      thickness: 0.5,
      indent: 7,
      endIndent: 7,
      color: Colors.white,
    );
  }

  Widget _switchTheme() {
    return SizedBox(
        height: 8,
        child: Switcher(
          switchValue: notificationON,
        ));
  }

  Widget _switchNotifications() {
    return SizedBox(
      height: 8,
      child: Switcher(switchValue: notificationON),
    );
  }
}
