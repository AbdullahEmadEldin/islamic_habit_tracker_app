import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/data/service/azkar/azkar_service.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 186, 188),
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
            top: size.height / 2 - 180,
            left: size.width / 2 - 70,
            child: Text(
              S.of(context).ZikrCollector,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontFamily: 'arabic_typesetting',
                  color: const Color(0xff6F5441)),
            ),
          ),
          Positioned(
            width: 330,
            height: size.height * 0.08,
            bottom: 40,
            left: size.width / 2 - 165,
            child: ElevatedButton(
              onPressed: () async {
                await AzkarService().loadZikrCategories();
                context.goNamed(AppRoutes.homeScreen);
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 155, 139, 141),
              )),
              child: Text(
                S.of(context).start,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
