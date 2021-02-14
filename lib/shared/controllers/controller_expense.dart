
import 'package:fluxo/shared/bd/core.dart';
import 'package:fluxo/shared/models/expense.dart';
import 'package:sqflite/sqflite.dart';

class ControllerExpense {

  Database _db;

  Future init() async {
    DatabaseFluxo database = new DatabaseFluxo();
    this._db = await database.db;
  }

  Future<int> insert(Expense expense) async {
    return await _db.insert('Expense', expense.toJson());
  }

  Future<int> update(Expense expense) async {
    return await _db.update('Expense', expense.toJson());
  }

  Future<int> delete(Expense expense) async {
    return await _db.delete('Expense', where: 'id = ?', whereArgs: [expense.id]);
  }

  Future<List<Expense>> findAll() async {
    List<Map> maps = await _db
        .query('Expense', columns: ['id', 'type', 'description', 'date', 'value']);
    if (maps.length > 0) {
      return List<Map<String, dynamic>>.from(maps)
          .map((e) => Expense.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<Expense> findById(int id) async {
    List<Map> maps = await _db.query('Expense',
        columns: ['id', 'type', 'description', 'date', 'value'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Expense.fromJson(maps.first);
    }
    return null;
  }

}