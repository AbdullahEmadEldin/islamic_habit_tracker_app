import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamic_habit_tracker/core/helpers/extensions.dart';

import '../../../localization/local_keys.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0.responsive(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'SvgAssets.noConnection',
          ),
          SizedBox(height: 32.0.responsive(context)),
          Text(
            LocalKeys.noConnectionTitle.tr(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          SizedBox(height: 16.0.responsive(context)),
          Text(
            LocalKeys.noConnectionDesc.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.surfaceDim,
                ),
          ),
          SizedBox(height: 24.0.responsive(context)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: StadiumBorder()),
              onPressed: () {},
              child: Text(
                LocalKeys.tryAgain.tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ))
        ],
      ),
    );
  }
}
