import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/logic/cubits/create_habit_cubit/create_habit_cubit.dart';
import 'package:islamic_habit_tracker/view/pages/habits_details.dart';

class HabitTileItem extends StatefulWidget {
  final Habit habit;
  const HabitTileItem({Key? key, required this.habit}) : super(key: key);
  @override
  _HabitTileItemState createState() => _HabitTileItemState();
}

class _HabitTileItemState extends State<HabitTileItem> {
  bool checkBoxBool = false;
  DateTime dateOnly =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  @override
  void initState() {
    super.initState();
    if (widget.habit.trakingDates != null &&
        widget.habit.trakingDates!.isNotEmpty) {
      TrackDate? todayTrackingDate = widget.habit.trakingDates
          ?.singleWhere((element) => element.date == dateOnly);

      checkBoxBool = todayTrackingDate!.done;
      print(
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx $checkBoxBool ---- ${widget.habit.habitName}');
    }
    print(
        '0000000000000000000000000000000000000 $checkBoxBool ---- ${widget.habit.habitName}');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HabitsDetails(mainHabit: widget.habit),
              ));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
                color: checkBoxBool ? Colors.transparent : Colors.grey),
            borderRadius: BorderRadius.circular(16),
            color: checkBoxBool
                ? const Color.fromARGB(255, 184, 176, 233).withOpacity(0.3)
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.habit.habitName,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    decoration:
                        checkBoxBool ? TextDecoration.lineThrough : null),
              ),
              Checkbox(
                  fillColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.deepPurple;
                    } else {
                      return Colors.transparent;
                    }
                  }),
                  shape: const CircleBorder(),
                  side: const BorderSide(color: Colors.deepPurple, width: 2),
                  value: checkBoxBool,
                  onChanged: (check) {
                    if (checkBoxBool == false) {
                      TrackDate date = TrackDate(date: dateOnly, done: true);
                      BlocProvider.of<CreateHabitCubit>(context)
                          .addTrackDate(widget.habit, date);
                      setState(() {
                        checkBoxBool = true;
                      });
                    }
                  })
            ],
          ),
        ));
  }
}
