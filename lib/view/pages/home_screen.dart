import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/data/models/tracking_date.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/logic/cubit/habit_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/empty_habit.dart';
import 'package:islamic_habit_tracker/view/widgets/habit_tile.dart';
import 'package:islamic_habit_tracker/view/widgets/horizontal_date_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isInputActive = false;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HabitsCubit>(context).getHabits();
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDatePickerHeader(size, context, textTheme),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
                child: Text(
                  S.of(context).dailyHabits,
                  style: textTheme.displayMedium!
                      .copyWith(color: const Color.fromARGB(255, 57, 16, 129)),
                ),
              ),
              // IconButton(
              //     onPressed: () {
              //       //  print('******************** ${dd}');
              //       BlocProvider.of<HabitsCubit>(context).deleteAllHabit();
              //     },
              //     icon: Icon(Icons.delete)),
              isInputActive
                  ? _createNewHabit(size, context)
                  : BlocBuilder<HabitsCubit, HabitsState>(
                      builder: (context, state) {
                        if (state is SucessHabits) {
                          if (state.habits.isEmpty) {
                            return const EmptyHabit();
                          }

                          return HabitTile(habits: state.habits);
                        }
                        return Container(
                          child: Text('staate: ${state.toString()}'),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerHeader(
      Size size, BuildContext context, TextTheme textTheme) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height / 4,
          width: double.infinity,
          color: const Color(0xFFF5ECFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                child: Text(
                  S.of(context).dailyRoutine,
                  style: textTheme.displayLarge,
                ),
              ),
              const HorizontalDatePicaker(),
            ],
          ),
        ),
        _addTaskButton(size, context),
      ],
    );
  }

  Positioned _addTaskButton(Size size, BuildContext context) {
    return Positioned(
      top: size.height * 0.22,
      left: size.width - 230,
      child: ElevatedButton(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(15),
            minimumSize: MaterialStatePropertyAll(Size(50, 50)),
            backgroundColor: MaterialStatePropertyAll(
              Color.fromARGB(255, 149, 136, 235),
            ),
            shape: MaterialStatePropertyAll(CircleBorder()),
          ),
          onPressed: () {
            isInputActive = true;
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }

  SizedBox _createNewHabit(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * 0.09,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          onSubmitted: (habitName) {
            if (habitName.isEmpty) {
              isInputActive = false;
            } else {
              isInputActive = false;
              BlocProvider.of<HabitsCubit>(context).createHabit(
                Habit(
                  habitName: habitName,
                  trakingDates: [],
                ),
              );
            }
            setState(() {});
          },
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(S.of(context).addHabit),
          ),
        ),
      ),
    );
  }
}
