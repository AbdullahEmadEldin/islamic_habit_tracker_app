import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/navigation/routes.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/view/pages/onboarding/build_onboard_screen.dart';
import 'package:islamic_habit_tracker/view/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingCollector extends StatefulWidget {
  const OnBordingCollector({Key? key}) : super(key: key);

  @override
  _OnBordingCollectorState createState() => _OnBordingCollectorState();
}

class _OnBordingCollectorState extends State<OnBordingCollector> {
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
                top: size.height * 0.4,
                right: size.width * 0.15,
                child: Image.asset(
                  AppAssets.onboardOne,
                  width: 140,
                  height: 140,
                ),
              ),
              subtitle: S.of(context).onboradingonedetail,
            ),
            OnboardingBuilder(
                isFirst: false,
                image: Positioned(
                  top: size.height * 0.3,
                  right: size.width * 0.25,
                  child: Image.asset(
                    AppAssets.mosque,
                    width: 200,
                    height: 200,
                  ),
                ),
                subtitle: S.of(context).onboardingtwo)
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
                        S.of(context).skip),
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
                          activeDotColor: AppColors.onboardingForeground,
                          dotColor: const Color.fromARGB(255, 216, 213, 213),
                        ),
                      ),
                    ),
                    _buildOnboardButton(
                        context,
                        () => _pageViewController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn),
                        S.of(context).next),
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
        context.goNamed(AppRoutes.homeScreen);
      },
      style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all(Size.fromHeight(size.height * 0.1)),
          backgroundColor: MaterialStatePropertyAll(
            AppColors.onboardingForeground,
          )),
      child: Text(
        S.of(context).start,
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
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        backgroundColor:
            MaterialStatePropertyAll(AppColors.onboardingForeground),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
      ),
      child: Text(text),
    );
  }
}
