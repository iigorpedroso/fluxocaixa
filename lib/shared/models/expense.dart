import 'package:fluxo/shared/bd/core.dart';
import 'package:sqflite/sqflite.dart';

class Expense {

  int id;
  int type;
  String description;
  DateTime date;
  double value;

  Expense(this.id, this.type, this.description, this.date, this.value);


  Expense.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        description = json['description'],
        date = DateTime.parse(json['date']),
        value = json['value'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'description': description,
    'date': date.toString(),
    'value': value,
  };


}

class ExpenseProvider {
  Database _db;


  Future init() async {
    DatabaseFluxo database = new DatabaseFluxo();
    this._db = await database.db;
  }


  Future<Expense> insert(Expense expense) async {
    expense.id = await _db.insert('Expense', expense.toJson());
    return expense;
  }


  Future<Expense> findById(int id) async {
    List<Map> maps = await _db.query('Expense',
        columns: ['id', 'type', 'observation', 'date', 'value'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Expense.fromJson(maps.first);
    }
    return null;
  }




}
