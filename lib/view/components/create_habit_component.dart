import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_habit_tracker/core/theme/app_theme.dart';
import 'package:islamic_habit_tracker/data/models/habit.dart';
import 'package:islamic_habit_tracker/generated/l10n.dart';
import 'package:islamic_habit_tracker/logic/cubits/create_habit_cubit/create_habit_cubit.dart';
import 'package:islamic_habit_tracker/view/widgets/habits_list_view.dart';

class CreateHabitComponent extends StatefulWidget {
  const CreateHabitComponent({super.key});

  @override
  State<CreateHabitComponent> createState() => _CreateHabitComponentState();
}

class _CreateHabitComponentState extends State<CreateHabitComponent> {
  late CreateHabitCubit createHabitCubit;
  TextEditingController habitNameController = TextEditingController();
  FocusNode focusNode = FocusNode();
  // bool isInputActive to switch between create habit textField and the habits list
  bool isInputActive = false;
  bool createHabitLoading = false;
  //
  double rotateAngle = 0;
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
              if (isInputActive) {
                _createNewHabit();
                return;
              }
              isInputActive = !isInputActive;
              focusNode.requestFocus();
              createHabitLoading = false;
              setState(() {});
            },
            child: isInputActive
                ? const Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                  )
                : const Icon(Icons.add),
          ),
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
                    : _newHabitTextField(size, context),
              )
            : const HabitsListView(),
      ],
    );
  }

  SizedBox _newHabitTextField(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * 0.09,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: habitNameController,
          focusNode: focusNode,
          onSubmitted: (habitName) {
            _createNewHabit();
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              label: Text(S.of(context).addHabit),
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.grey)),
        ),
      ),
    );
  }

  void _createNewHabit() {
    if (habitNameController.text.isEmpty) {
      isInputActive = false;
      focusNode.unfocus();
    } else {
      isInputActive = false;
      createHabitCubit.createHabit(
        Habit(
          habitName: habitNameController.text,
          trakingDates: [],
        ),
      );
    }
    setState(() {});
  }
}
