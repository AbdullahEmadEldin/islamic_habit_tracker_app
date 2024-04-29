import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';

class OnboardingBuilder extends StatelessWidget {
  final bool isFirst;
  final Widget image;
  final String subtitle;
  final Widget illustratingImage;
  const OnboardingBuilder({
    super.key,
    required this.isFirst,
    required this.image,
    required this.subtitle,
    required this.illustratingImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.splashBackground.withOpacity(0.7),
      child: Stack(
        children: [
          SizedBox(height: size.height * 0.2),
          isFirst
              ? Positioned(
                  width: 300,
                  top: size.height * 0.07,
                  left: size.width / 2 - 150,
                  child: Image.asset(AppAssets.splashLogo),
                )
              : const SizedBox(),
          isFirst
              ? Positioned(
                  top: size.height * 0.38,
                  right: size.width * 0.33,
                  child: Text(
                    S.of(context).onboradingone,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 16),
          image,
          const SizedBox(height: 23),
          Positioned(
            top: size.height * 0.49,
            left: size.width * 0.14,
            child: SizedBox(
              width: size.width * 0.5,
              child: Text(
                subtitle,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          Positioned(
            width: 300,
            top: size.height * 0.01,
            right: size.width * 0.6,
            child: Image.asset(AppAssets.clouds),
          ),
          Positioned(
            width: 500,
            top: size.height * 0.6,
            right: -320,
            child: Image.asset(AppAssets.clouds),
          ),
          illustratingImage,
        ],
      ),
    );
  }
}
