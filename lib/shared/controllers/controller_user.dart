
import 'package:fluxo/shared/bd/core.dart';
import 'package:fluxo/shared/models/expense.dart';
import 'package:fluxo/shared/models/user.dart';
import 'package:sqflite/sqflite.dart';

class ControllerUser {

  Database _db;


  Future init() async {
    DatabaseFluxo database = new DatabaseFluxo();
    this._db = await database.db;
  }


  Future<User> insert(User user) async {
    user.id = await _db.insert('User', user.toJson());
    return user;
  }


  Future<User> findByEmail(String email) async {
    List<Map> maps = await _db.query('User',
        columns: ['id', 'email', 'password', 'name'],
        where: 'email = ?',
        whereArgs: [email]);
    if (maps.length > 0) {
      return User.fromJson(maps.first);
    }
    return null;
  }



}