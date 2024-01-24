import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Stack(
        children: [
          Positioned(
            width: 500,
            right: -140,
            child: Image.asset(AppAssets.clouds),
          ),
          Positioned(
            width: 500,
            top: 60,
            left: -350,
            child: Image.asset(AppAssets.clouds),
          ),
          Positioned(
            width: 300,
            top: size.height / 2 - 150,
            left: size.width / 2 - 150,
            child: Image.asset(AppAssets.splashLogo),
          ),
          Positioned(
            width: 500,
            bottom: 60,
            right: -300,
            child: Image.asset(AppAssets.clouds),
          ),
          Positioned(
            top: size.height / 2 - 195,
            left: size.width / 2 - 20,
            child: Column(
              children: [
                Text(
                  S.of(context).Dawm,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontFamily: 'arabic_typesetting',
                      color: const Color(0xff674D9D)),
                ),
                const Text(
                  'D A W M',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff674D9D)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
