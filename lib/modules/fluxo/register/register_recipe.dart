import 'package:flutter/material.dart';



class RegisterRecipe extends StatefulWidget {
  @override
  _RegisterRecipeState createState() => _RegisterRecipeState();
}

class _RegisterRecipeState extends State<RegisterRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Receitas"),
      ),
    );
  }
}
