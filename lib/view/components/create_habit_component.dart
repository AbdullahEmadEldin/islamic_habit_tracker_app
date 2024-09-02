import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/logic/cubits/create_habit_cubit/create_habit_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/habits_list_view.dart';

// TODO : when tab add task button:
//        ==> focus on text field.
//        ==> rotate icon to appear as x and cancel the create task if it tapped again.

class CreateHabitComponent extends StatefulWidget {
  const CreateHabitComponent({super.key});

  @override
  State<CreateHabitComponent> createState() => _CreateHabitComponentState();
}

class _CreateHabitComponentState extends State<CreateHabitComponent> {
  late CreateHabitCubit createHabitCubit;
  bool isInputActive = false;
  bool createHabitLoading = false;
  @override
  void initState() {
    createHabitCubit = BlocProvider.of<CreateHabitCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(15),
                minimumSize: const WidgetStatePropertyAll(Size(50, 50)),
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.primary.withOpacity(0.7),
                ),
                foregroundColor: const WidgetStatePropertyAll(Colors.white),
                shape: const WidgetStatePropertyAll(CircleBorder()),
              ),
              onPressed: () {
                isInputActive = true;
                createHabitLoading = false;
                setState(() {});
              },
              child: const Icon(Icons.add)),
        ),
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
