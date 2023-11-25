// import 'package:get/get.dart';

// import '../db/db_helper.dart';

// import '../models/task.dart';

// class TaskController extends GetxController {

//   final RxList<Task> taskList = <Task>[].obs;

//   /* Task(
//       id: 4,
//       title: 'Title 4',
//       note: 'Not 4 Something',
//       isCompleted: 0,
//       startTime: DateFormat('hh:mm a')
//           .format(DateTime.now().add(const Duration(minutes: 1)))
//           .toString(),
//       color: 0,
//     ), */
//   /*  (Task
//       title: 'Title 2',
//       note: 'Not Something2',
//       isCompleted: 0,
//       startTime: '8:18',
//       endTime: '20:40',
//       color: 1,
//     ),
//     Task(
//       title: 'Title 3',
//       note: 'Not Something3',
//       isCompleted: 1,
//       startTime: '8:18',
//       endTime: '20:40',
//       color: 2,
//     ), 
    
//   ];*/

//   Future<int> addTask({required Task task}) {
//     return DBHelper.insert(task);
//   }

//   Future<void> getTasks() async {
//     final List<Map<String, dynamic>> tasks = await DBHelper.query();
//     taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
//   }

//   void deleteTasks(Task task) async {
//     await DBHelper.delete(task);
//     getTasks();
//   }
//   void deleteAllTasks( ) async {
//     await DBHelper.deleteAll();
//     getTasks();
//   }

//   void markTaskCompleted(int id) async {
//     await DBHelper.update(id);
//     getTasks();
//   }
//   // addTask(){}
// }
