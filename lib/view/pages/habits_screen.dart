// import 'package:azkar_app/core/locator.dart';
// import 'package:azkar_app/data/models/habit.dart';
// import 'package:azkar_app/data/service/habit_database/habits_repository.dart';
// import 'package:azkar_app/generated/l10n.dart';
// import 'package:azkar_app/view/widgets/empty_habit.dart';
// import 'package:flutter/material.dart';

// class HabitsScreen extends StatefulWidget {
//   const HabitsScreen({Key? key, this.update}) : super(key: key);
//   final update;

//   @override
//   _HabitsScreenState createState() => _HabitsScreenState();
// }

// typedef MyBuilder = void Function(
//     BuildContext context, void Function() methodFromChild);

// class _HabitsScreenState extends State<HabitsScreen> {
//   bool isInputActive = false;
//   @override
//   Widget build(BuildContext context) {
//     print('inside');
//     List<Habit> habits = locator.get<HabitsRepository>().getAllHabits();
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         S.of(context).allHabits,
//                         style: Theme.of(context).textTheme.displayLarge,
//                       ),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           locator.get<HabitsRepository>().removeAllHabits();
//                           setState(() {});

//                           ///update method is passed to allHaits to call SetState of home
//                           ///beacuse it isn't called dynamically for unknown behaviour
//                           widget.update();
//                         },
//                         child: Text(S.of(context).deleteAll))
//                   ],
//                 ),
//                 isInputActive
//                     ? _createNewHabit(size, context)
//                     : const SizedBox(),
//                 habits.isEmpty
//                     ? SizedBox(
//                         height: size.height * 0.85,
//                         child: const Center(child: EmptyHabit()))
//                     : _habitsList(habits),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.deepPurple,
//           elevation: 10,
//           shape: const CircleBorder(),
//           onPressed: () {
//             isInputActive = true;
//             setState(() {});
//           },
//           child: const Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       ),
//     );
//   }

//   ListView _habitsList(List<Habit> habits) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: habits.length,
//       itemBuilder: (context, index) => Container(
//         padding: const EdgeInsets.all(8),
//         margin: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: const Color.fromARGB(255, 184, 176, 233).withOpacity(0.3),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               habits[index].taskText,
//               style: Theme.of(context).textTheme.displayMedium,
//             ),
//             IconButton(
//                 onPressed: () {
//                   print(habits[index].id);
//                   locator.get<HabitsRepository>().removeHabit(habits[index].id);
//                   widget.update();
//                   setState(() {});
//                 },
//                 icon: const Icon(Icons.delete))
//           ],
//         ),
//       ),
//     );
//   }

//   SizedBox _createNewHabit(Size size, BuildContext context) {
//     return SizedBox(
//       height: size.height * 0.09,
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: TextField(
//           onSubmitted: (value) {
//             if (value.isEmpty) {
//               isInputActive = false;
//             } else {
//               locator.get<HabitsRepository>().createHabit(
//                   Habit(taskText: value, date: DateTime.now(), done: false));
//               isInputActive = false;
//             }
//             setState(() {});
//           },
//           decoration: InputDecoration(
//             border: const OutlineInputBorder(),
//             label: Text(S.of(context).addHabit),
//           ),
//         ),
//       ),
//     );
//   }
// }
