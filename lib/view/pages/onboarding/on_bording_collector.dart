import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';

import 'package:islamic_habit_tracker/view/pages/onboarding/build_onboard_screen.dart';
import 'package:islamic_habit_tracker/view/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/localization/local_keys.dart';

class OnBoardingCollector extends StatefulWidget {
  const OnBoardingCollector({Key? key}) : super(key: key);

  @override
  _OnBoardingCollectorState createState() => _OnBoardingCollectorState();
}

class _OnBoardingCollectorState extends State<OnBoardingCollector> {
  final _pageViewController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: PageView(
          controller: _pageViewController,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            const SplashScreen(),
            OnboardingBuilder(
              isFirst: true,
              image: Positioned(
                top: size.height * 0.39,
                right: size.width * 0.1,
                child: Image.asset(
                  AppAssets.onboardOne,
                  width: 140,
                  height: 140,
                ),
              ),
              subtitle: LocalKeys.onboradingonedetail.tr(),
              illustratingImage: Positioned(
                top: size.height * 0.6,
                right: size.width * 0.45,
                child: Image.asset(
                  AppAssets.onboardingHome,
                  width: 220,
                  height: 220,
                ),
              ),
            ),
            OnboardingBuilder(
              isFirst: false,
              image: Positioned(
                top: size.height * 0.25,
                right: size.width * 0.25,
                child: Image.asset(
                  AppAssets.mosque,
                  width: 200,
                  height: 200,
                ),
              ),
              subtitle: LocalKeys.onboardingtwo.tr(),
              illustratingImage: Positioned(
                top: size.height * 0.59,
                right: size.width * 0.4,
                child: Image.asset(
                  AppAssets.onboardingAzkar,
                  width: 220,
                  height: 220,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? _getSartedButton(context, size)
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.lSecondaryBackground),
              height: size.height * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildOnboardButton(
                        context,
                        () => _pageViewController.animateToPage(2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                        LocalKeys.skip.tr()),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageViewController,
                        count: 3,
                        onDotClicked: (index) =>
                            _pageViewController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn),
                        effect: WormEffect(
                          dotHeight: 8,
                          radius: 16,
                          activeDotColor: AppColors.primary,
                          dotColor: const Color.fromARGB(255, 216, 213, 213),
                        ),
                      ),
                    ),
                    _buildOnboardButton(
                        context,
                        () => _pageViewController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                        LocalKeys.next.tr()),
                  ]),
            ),
    );
  }

  ElevatedButton _getSartedButton(BuildContext context, Size size) {
    return ElevatedButton(
      onPressed: () async {
        ///Saving the state of starting the app
        ///to naivgate directly to homePage after the first time
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('showHome', true);
        print('********** ${prefs.getBool('showHome')}');
        context.goNamed(AppRoutes.homeScreen);
      },
      style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(Size.fromHeight(size.height * 0.1)),
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primary,
          )),
      child: Text(
        LocalKeys.start.tr(),
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  ElevatedButton _buildOnboardButton(
      BuildContext context, Function() ontap, String text) {
    return ElevatedButton(
      onPressed: ontap,
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        foregroundColor: const WidgetStatePropertyAll(Colors.white),
      ),
      child: Text(text),
    );
  }
}
