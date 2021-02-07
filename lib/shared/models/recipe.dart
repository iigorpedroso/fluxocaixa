import 'package:fluxo/shared/bd/core.dart';
import 'package:sqflite/sqflite.dart';

class Recipe {

  int id;
  int type;
  String observation;
  DateTime date;
  double value;

  Recipe(this.id, this.type, this.observation, this.date, this.value);


  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        observation = json['observation'],
        date = json['date'],
        value = json['value'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'observation': observation,
    'date': date,
    'value': value,
  };


}

