
import 'package:fluxo/shared/bd/core.dart';
import 'package:fluxo/shared/models/type_expense.dart';
import 'package:sqflite/sqflite.dart';

class ControllerTypeExpense {

  Database _db;

  Future init() async {
    DatabaseFluxo database = new DatabaseFluxo();
    this._db = await database.db;
  }

  Future<int> insert(TypeExpense typeExpense) async {
    return await _db.insert('TypeExpense', typeExpense.toJson());
  }

  Future<int> update(TypeExpense typeExpense) async {
    return await _db.update('TypeExpense', typeExpense.toJson());
  }

  Future<int> delete(TypeExpense typeExpense) async {
    return await _db.delete('TypeExpense', where: 'id = ?', whereArgs: [typeExpense.id]);
  }

  Future<List<TypeExpense>> findAll() async {
    List<Map> maps = await _db
        .query('TypeExpense', columns: ['id', 'name', 'description']);
    if (maps.length > 0) {
      return List<Map<String, dynamic>>.from(maps)
          .map((e) => TypeExpense.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<TypeExpense> findById(int id) async {
    List<Map> maps = await _db.query('TypeExpense',
        columns: ['id', 'name', 'description'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return TypeExpense.fromJson(maps.first);
    }
    return null;
  }

}