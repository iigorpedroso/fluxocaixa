
import 'package:fluxo/shared/bd/core.dart';
import 'package:fluxo/shared/models/recipe.dart';
import 'package:sqflite/sqflite.dart';

class ControllerRecipe {

  Database _db;

  Future init() async {
    DatabaseFluxo database = new DatabaseFluxo();
    this._db = await database.db;
  }

  Future<int> insert(Recipe recipe) async {
    return await _db.insert('Recipe', recipe.toJson());
  }

  Future<int> update(Recipe recipe) async {
    return await _db.update('Recipe', recipe.toJson());
  }

  Future<int> delete(Recipe recipe) async {
    return await _db.delete('Recipe', where: 'id = ?', whereArgs: [recipe.id]);
  }

  Future<List<Recipe>> findAll() async {
    List<Map> maps = await _db
        .query('Recipe', columns: ['id', 'type_id', 'observation', 'date', 'value']);
    if (maps.length > 0) {
      return List<Map<String, dynamic>>.from(maps)
          .map((e) => Recipe.fromJson(e))
          .toList();
    }
    return [];
  }

  Future<Recipe> findById(int id) async {
    List<Map> maps = await _db.query('Recipe',
        columns: ['id', 'type_id', 'observation', 'date', 'value'],
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Recipe.fromJson(maps.first);
    }
    return null;
  }

}