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

  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  readDataById(table, itemId) async {
    var connection = await database;
    return await connection
        ?.query(table, where: 'idCustomer=?', whereArgs: [itemId]);
  }

  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }

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

    final result = await connection?.rawQuery(
      'SELECT credit, debit, dateProcedures, nameProcedures '
      'FROM procedures '
      'WHERE idCustomer = ? '
      'AND dateProcedures BETWEEN ? AND ?',
      [id, from, to],
    );
    return result;
  }

  readAllProceduresCustomerSum(id) async {
    var connection = await database;

    final result = await connection?.rawQuery(
      'SELECT sum(credit) credit, sum(debit) debit '
      'FROM procedures '
      'WHERE idCustomer = ? ',
      [id],
    );
    return result;
  }

  Future<List<Map<String, Object?>>?>? readDataById1(table, itemId) async {
    var connection = await database;
    return await connection
        ?.query(table, where: 'idCustomer=?', whereArgs: [itemId]);
  }
}
