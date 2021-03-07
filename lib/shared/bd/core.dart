import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

String _createTypeExpense = '''CREATE TABLE TypeExpense (
                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                      name TEXT NOT NULL,
                      description TEXT NOT NULL)''';


String _createExpense = '''CREATE TABLE Expense (
                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                      type INTEGER,
                      description TEXT NOT NULL,
                      date TIMESTAMP NOT NULL,
                      value FLOAT NOT NULL)''';

String _createTypeRecipe = '''CREATE TABLE TypeRecipe (
                      id INTEGER PRIMARY KEY AUTOINCREMENT, 
                      name TEXT NOT NULL,
                      description TEXT NOT NULL)''';

String _createRecipe = '''CREATE TABLE Recipe (
                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                      type INTEGER,
                      description TEXT NOT NULL,
                      date TIMESTAMP NOT NULL,
                      value FLOAT NOT NULL)''';

String _createUser = '''CREATE TABLE User (
                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                      email TEXT NOT NULL,
                      password TEXT NOT NULL,
                      name TEXT NOT NULL)''';



class DatabaseFluxo {
  static final DatabaseFluxo _instance =
  DatabaseFluxo.internal();

  factory DatabaseFluxo() => _instance;

  DatabaseFluxo.internal();

  Database _db;


  Future<Database> get db async {
    if (_db != null) {
      if (_db.isOpen) return _db;
      final dataBasePath = await getDatabasesPath();
      final path = join(dataBasePath, "fluxo.db");
      return await openDatabase(path);
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, "fluxp.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newVersionVersion) async {
          await db.execute(_createTypeExpense);
          await db.execute(_createExpense);
          await db.execute(_createTypeRecipe);
          await db.execute(_createRecipe);
          await db.execute(_createUser);
        });
  }
}
