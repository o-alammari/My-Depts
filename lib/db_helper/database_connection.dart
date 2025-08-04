import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    // var directory = await getDatabasesPath();
    // var directory = await getApplicationDocumentsDirectory();
    // var path = '${await getDatabasesPath()},database.db';
    // var path1 = join(await getDatabasesPath(), 'db_crud');
    var database = await openDatabase(
        join(await getDatabasesPath(), 'doggie_database.db'),
        version: 1,
        onCreate: _createDatabase);
    // await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;

    // Database database;
    // try {
    //   database =
    //       await openDatabase(path, version: 1, onCreate: _createDatabase);
    //   return database;
    // } catch (e) {
    //   return database;
    // }
  }
  

  Future<void> _createDatabase(Database database, int version) async {
    String sql1 =
        "CREATE TABLE users (id INTEGER PRIMARY KEY,userName TEXT,password Text);";
    String sql2 =
        "CREATE TABLE customers (id INTEGER PRIMARY KEY,nameCustomer TEXT,phoneCustomer Text,    TEXT);";
    String sql3 =
        // "CREATE TABLE procedures (id INTEGER PRIMARY KEY,nameProcedures TEXT,idCustomer INTEGER,dateProcedures TEXT,credit TEXT,debit TEXT);";
        // "CREATE TABLE procedures (id INTEGER PRIMARY KEY,nameProcedures TEXT,idCustomer INTEGER,dateProcedures TEXT,credit INTEGER,debit INTEGER, FOREIGN KEY (idCustomer) REFERENCES customers (id));";
        "CREATE TABLE procedures (id INTEGER PRIMARY KEY,nameProcedures TEXT,idCustomer INTEGER,dateProcedures TEXT,credit INTEGER,debit INTEGER, FOREIGN KEY (idCustomer) REFERENCES customers (id));";
        // "CREATE TABLE procedures (id INTEGER PRIMARY KEY,nameProcedures TEXT,idCustomer INTEGER,dateProcedures TEXT,credit TEXT,debit TEXT, FOREIGN KEY (idCustomer) REFERENCES customers (id));";
    await database.execute(sql1);
    await database.execute(sql2);
    await database.execute(sql3);
  }
}
