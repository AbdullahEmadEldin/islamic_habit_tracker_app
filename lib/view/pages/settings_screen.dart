// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/logic/cubits/delete_habits_cubits/delete_habits_cubit.dart';
import 'package:islamic_habit_tracker/logic/cubits/habit_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/drop_menu_component.dart';
import 'package:islamic_habit_tracker/view/widgets/setting_option.dart';
import 'package:islamic_habit_tracker/view/widgets/switcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            height: size.height * 0.55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35)),
              gradient: LinearGradient(
                  colors: [AppColors.lContainerColor, Color(0xff674D9D)]),
            ),
          ),
          Positioned(
            top: size.height * 0.04,
            left: size.width * 0.65,
            child: _buildSettingsHeader(context),
          ),
          _settingsOptionsBuilder(size, context),
          Positioned(
              top: size.height * 0.5,
              left: size.width / 2 - 140,
              child: Image.asset(
                AppAssets.settingsBanner,
                width: size.height * 0.32,
                height: size.height * 0.32,
              ))
        ],
      ),
    );
  }

  Widget _settingsOptionsBuilder(Size size, BuildContext context) {
    return Positioned(
        top: 78,
        left: size.width / 2 - 140,
        child: Container(
          height: size.height * 0.4,
          width: size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lSecondaryBackground.withOpacity(0.3),
          ),
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
                    onTap: () {},
                    isClickable: false,
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.language,
                    setting: S.of(context).lang,
                    trailing: SizedBox(
                        height: size.height * 0.02, child: PopMenuComponent()),
                    onTap: () {},
                    isClickable: false,
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.mail,
                    setting: S.of(context).help,
                    onTap: () {},
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.delete_outline_outlined,
                    setting: S.of(context).DeleteAllData,
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      BlocProvider.of<DeleteHabitsCubit>(context)
                          .deleteAllHabits();
                      await prefs.setBool('showHome', false);
                      context.goNamed(AppRoutes.onBoarding);
                    },
                  ),
                  _buildDivider(),
                  SettingOption(
                    icon: Icons.error,
                    setting: S.of(context).About,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildSettingsHeader(BuildContext context) {
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

  Widget _switchNotifications() {
    return SizedBox(
      height: 8,
      child: NotificationSwitcher(
        switchValue: notificationON,
        onChanged: (value) {},
      ),
    );
  }
}
