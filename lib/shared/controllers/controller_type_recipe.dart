
import 'package:fluxo/shared/bd/core.dart';
import 'package:fluxo/shared/models/type_recipe.dart';
import 'package:sqflite/sqflite.dart';

class ControllerTypeRecipe {

  Database _db;

  Future init() async {
    DatabaseFluxo database = new DatabaseFluxo();
    this._db = await database.db;
  }

  Future<int> insert(TypeRecipe typeRecipe) async {
    return await _db.insert('TypeRecipe', typeRecipe.toJson());
  }

  Future<int> update(TypeRecipe typeExpense) async {
    return await _db.update('TypeRecipe', typeExpense.toJson());
  }

  Future<int> delete(TypeRecipe typeExpense) async {
    return await _db.delete('TypeRecipe', where: 'id = ?', whereArgs: [typeExpense.id]);
  }

  Future<List<TypeRecipe>> findAll() async {
    List<Map> maps = await _db
        .query('TypeRecipe', columns: ['id', 'name', 'description']);
    if (maps.length > 0) {
      return List<Map<String, dynamic>>.from(maps)
          .map((e) => TypeRecipe.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<TypeRecipe> findById(int id) async {
    List<Map> maps = await _db.query('TypeRecipe',
        columns: ['id', 'name', 'description'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return TypeRecipe.fromJson(maps.first);
    }
    return null;
  }

}