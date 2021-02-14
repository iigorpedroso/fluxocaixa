
class Recipe {

  int id;
  int type;
  String description;
  DateTime date;
  double value;

  Recipe(this.id, this.type, this.description, this.date, this.value);


  Recipe.fromJson(Map<String, dynamic> json)
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

