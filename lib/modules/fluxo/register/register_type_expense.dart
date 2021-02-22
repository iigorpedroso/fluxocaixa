import 'package:flutter/material.dart';
import 'package:fluxo/shared/controllers/controller_type_expense.dart';
import 'package:fluxo/shared/models/type_expense.dart';
import 'package:fluxo/shared/utils/components/form.dart';

class RegisterTypeExpense extends StatefulWidget {
  @override
  _RegisterTypeExpenseState createState() => _RegisterTypeExpenseState();
}

class _RegisterTypeExpenseState extends State<RegisterTypeExpense> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  ControllerTypeExpense _controller = new ControllerTypeExpense();
  List<TypeExpense> list = [];

  @override
  void initState() {
    super.initState();
    this._controller.init().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro Tipo Gasto"),
        ),
        bottomNavigationBar: _buttonInsert(),
        body: SingleChildScrollView(child: this._body()));
  }

  Widget _body() {
    return Column(children: [
      _name(),
      _description(),
    ]);
  }

  Widget _buttonInsert() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: RaisedButton(
          color: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: this.insert),
    );
  }

  Widget _description() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Descrição",
        hintText: "Digite a descrição",
        line: 3,
        controller: _descriptionController,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _name() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Nome",
        hintText: "Digite o nome",
        line: 1,
        controller: _nameController,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  void insert() {
    TypeExpense typeRecipe = new TypeExpense(
        null, this._nameController.text, this._descriptionController.text);
    this._controller.insert(typeRecipe);
    this.clean();
    Navigator.pop(context);
  }

  void clean() {
    FocusScope.of(context).unfocus();
    this._descriptionController.text = "";
    this._nameController.text = "";
  }
}
