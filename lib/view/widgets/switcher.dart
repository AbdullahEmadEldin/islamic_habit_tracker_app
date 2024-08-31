// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/theme/theme_manager.dart';
import 'package:islamic_habit_tracker/data/service/notification_service.dart';
import 'package:islamic_habit_tracker/features/azkar/view/pages/azkar_screen.dart';

class NotificationSwitcher extends StatefulWidget {
  bool switchValue;
  Function(bool value) onChanged;
  NotificationSwitcher({
    Key? key,
    required this.switchValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _NotificationSwitcherState createState() => _NotificationSwitcherState();
}

class _NotificationSwitcherState extends State<NotificationSwitcher> {
  @override
  void initState() {
    listenToNotificationStream();
    locator.get<NotificationService>().initializePlatformNotifications();
    super.initState();
  }

  void listenToNotificationStream() =>
      locator.get<NotificationService>().behaviorSubject.listen((payload) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AzkarScreen()));
      });
  @override
  Widget build(BuildContext context) {
    return Switch(
      splashRadius: 100,
      value: widget.switchValue,
      onChanged: (value) {
        widget.switchValue = value;
        widget.onChanged(value);
        setState(() {});
      },
    );
  }
}
