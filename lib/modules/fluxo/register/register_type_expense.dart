import 'package:flutter/material.dart';



class RegisterTypeExpense extends StatefulWidget {
  @override
  _RegisterTypeExpenseState createState() => _RegisterTypeExpenseState();
}

class _RegisterTypeExpenseState extends State<RegisterTypeExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Tipo Gasto"),
      ),
    );
  }
}
