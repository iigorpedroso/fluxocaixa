import 'package:fluxo/shared/bd/core.dart';
import 'package:sqflite/sqflite.dart';

class User {

  int id;
  String email;
  String password;
  String name;

  User(this.id, this.email, this.password, this.name);


  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        password = json['password'],
        name = json['name'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'password': password,
    'name': name,
  };


}
