import 'package:flutter/material.dart';



class RegisterExpense extends StatefulWidget {
  @override
  _RegisterExpenseState createState() => _RegisterExpenseState();
}

class _RegisterExpenseState extends State<RegisterExpense> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Gastos"),
      ),
    );
  }
}
