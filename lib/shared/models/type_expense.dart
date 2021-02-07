class TypeExpense {

  int id;
  String name;
  String description;

  TypeExpense(this.id, this.name, this.description);


  TypeExpense.fromJson(Map<String, dynamic> json)
    : id = json['id'],
    name = json['name'],
    description = json['name'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description
  };

}