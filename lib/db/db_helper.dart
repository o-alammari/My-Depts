// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';

// import '../models/task.dart';

// class DBHelper {
//   static Database? _db;
//   static const int _version = 1;
//   static const String _tableName = 'tasks';

//   static Future<void> initDB() async {
//     if (_db != null) {
//       debugPrint('Not null DB');
//       print('Not null DB');
//       return;
//     } else {
//       try {
//         // String _path = await getDatabasesPath() + 'task.db';
//         final String path = '${await getDatabasesPath()}task.db';
//         debugPrint('in database path');
//         print('in database path');
//         _db = await openDatabase(path, version: _version,
//             onCreate: (Database db, int version) async {
//           // When creating the db, create the table
//           await db.execute(
//             'CREATE TABLE $_tableName ('
//             'id INTEGER PRIMARY KEY AUTOINCREMENT, '
//             'title STRING, note TEXT, date STRING,'
//             ' startTime STRING, endTime STRING,'
//             ' remind INTEGER, repeat STRING,'
//             ' color INTEGER, isCompleted INTEGER)',
//           );
//         });
//       } catch (e) {
//         print(e);
//       }
//     }
//   }

//   static Future<int> insert(Task task) async {
//     print('insert function call');
//     try {
//       return await _db!.insert(_tableName, task.toJson());
//     } catch (e) {
//       print('Error insert');
//       return 90000;
//     }
//   }

//   static Future<int> delete(Task task) async {
//     print('delete function call');
//     return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
//   }

//   static Future<int> deleteAll() async {
//     print('delete All function call');
//     return await _db!.delete(_tableName);
//   }

//   static Future<List<Map<String, dynamic>>> query() async {
//     print('query function call');
//     return await _db!.query(_tableName);
//   }

//   // static Future<int> update(int isCompleted,int id) async {
//   static Future<int> update(int id) async {
//     print('update function call');
//     return await _db!.rawUpdate('''

//     UPDATE tasks SET isCompleted = ? 
//     WHERE id = ?
//     ''', [1, id]);
//     // ''', [isCompleted, id]);
//   }
// }
