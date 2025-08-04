import 'package:sqflite/sqflite.dart';

import 'database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  //Insert User
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //Read All Record
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  //Read a Single Record By ID
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection
        ?.query(table, where: 'idCustomer=?', whereArgs: [itemId]);
    // return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //Update
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }

  //validation signInUser
  Future<bool> signInUser(table, data) async {
    var connection = await database;
    final result = await connection?.query(
      'users',
      where: 'userName = ? AND password = ?',
      whereArgs: [data.userName, data.password],
    );
    if (result!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  readAllProceduresCustomer(id, from, to) async {
    var connection = await database;
    final result = await connection?.query(
      'procedures',
      where: 'idCustomer=? AND dateProcedures BETWEEN ? AND ? ',
      whereArgs: [id, from, to],
    );
    return result;
  }

  readAllProceduresCustomer1(id, from, to) async {
    var connection = await database;
    // final result = await connection?.rawQuery(
    //     'SELECT nameProcedures, idCustomer, credit, debit FROM procedures WHERE idCustomer=$id AND dateProcedures BETWEEN $from AND $to ');
    final result = await connection?.rawQuery(
      'SELECT credit, debit, dateProcedures, nameProcedures '
      'FROM procedures '
      'WHERE idCustomer = ? '
      'AND dateProcedures BETWEEN ? AND ?',
      [id, from, to],
    );
    print(result);
    return result;
  }

  readAllProceduresCustomerSum(id) async {
    var connection = await database;
    // final result = await connection?.rawQuery(
    //     'SELECT nameProcedures, idCustomer, credit, debit FROM procedures WHERE idCustomer=$id AND dateProcedures BETWEEN $from AND $to ');
    final result = await connection?.rawQuery(
      'SELECT sum(credit) credit, sum(debit) debit '
      'FROM procedures '
      'WHERE idCustomer = ? ',
      // 'AND dateProcedures BETWEEN ? AND ?',
      [id],
    );
    print(result);
    return result;
  }

  Future<List<Map<String, Object?>>?>? readDataById1(table, itemId) async {
    var connection = await database;
    return await connection
        ?.query(table, where: 'idCustomer=?', whereArgs: [itemId]);
    // return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }
}
