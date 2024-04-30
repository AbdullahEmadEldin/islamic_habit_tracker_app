import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/core/app_assets.dart';
import 'package:islamic_habit_tracker/core/locator.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/logic/cubits/create_habit_cubit/create_habit_cubit.dart';
import 'package:islamic_habit_tracker/logic/cubits/delete_habits_cubits/delete_habits_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/habits_list_view.dart';
import 'package:islamic_habit_tracker/view/widgets/horizontal_date_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CreateHabitCubit createHabitCubit;
  bool isInputActive = false;
  bool createHabitLoading = false;

  @override
  void initState() {
    super.initState();
    createHabitCubit = BlocProvider.of<CreateHabitCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLogoHeader(context),
              _buildDatePickerHeader(size, context, textTheme),
              isInputActive
                  ? BlocListener<CreateHabitCubit, CreateHabitState>(
                      listener: (context, state) {
                        if (state is CreateHabitLoading) {
                          createHabitLoading = true;
                        }
                      },
                      child: createHabitLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _createNewHabit(size, context),
                    )
                  : const HabitsListView(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildLogoHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.lContainerColor, AppColors.lBackground],
          begin: Alignment.topLeft,
          transform: const GradientRotation(pi / 4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                S.of(context).Dawm,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Text('D A W M')
            ],
          ),
          Image.asset(
            AppAssets.splashLogo,
            width: 100,
            height: 100,
          )
        ],
      ),
    );
  }

  Widget _buildDatePickerHeader(
      Size size, BuildContext context, TextTheme textTheme) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: size.height / 4,
          width: double.infinity,
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
      top: size.height * 0.17,
      left: size.width - 220,
      child: ElevatedButton(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(15),
            minimumSize: MaterialStatePropertyAll(Size(50, 50)),
            backgroundColor: MaterialStatePropertyAll(
              Color.fromARGB(255, 149, 136, 235),
            ),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(CircleBorder()),
          ),
          onPressed: () {
            isInputActive = true;
            createHabitLoading = false;
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
              createHabitCubit.createHabit(
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
