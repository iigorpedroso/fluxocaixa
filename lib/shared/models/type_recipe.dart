class TypeRecipe {

  int id;
  String name;
  String description;

  TypeRecipe(this.id, this.name, this.description);


  TypeRecipe.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['name'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description
  };

}