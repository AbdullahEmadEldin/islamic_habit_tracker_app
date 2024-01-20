import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/logic/cubit/habit_cubit.dart';

class HabitTile extends StatefulWidget {
  final List<Habit> habits;
  const HabitTile({Key? key, required this.habits}) : super(key: key);

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.habits.length,
        itemBuilder: (context, i) {
          DateTime now = DateTime.now();
          DateTime dateOnly = DateTime(now.year, now.month, now.day);
          bool checkBoxBool = false;

          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border:
                  Border.all(color: 1 == 2 ? Colors.transparent : Colors.grey),
              borderRadius: BorderRadius.circular(16),
              color: 1 == 2
                  ? const Color.fromARGB(255, 184, 176, 233).withOpacity(0.3)
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.habits[i].habitName,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      decoration: 1 == 2 ? TextDecoration.lineThrough : null),
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
                      TrackDate date = TrackDate(date: dateOnly, done: true);
                      BlocProvider.of<HabitsCubit>(context)
                          .addTrackDate(widget.habits[i], date);
                      setState(() {});
                    })
              ],
            ),
          );
        });
  }
}
