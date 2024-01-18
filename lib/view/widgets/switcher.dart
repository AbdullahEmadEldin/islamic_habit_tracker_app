import 'package:flutter/material.dart';

class Switcher extends StatefulWidget {
  bool switchValue;
  Switcher({Key? key, required this.switchValue}) : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      splashRadius: 100,
      value: widget.switchValue,
      onChanged: (value) {
        widget.switchValue = value;
        setState(() {});
      },
    );
  }
}
