import 'package:flutter/material.dart';
import 'package:fluxo/shared/controllers/controller_expense.dart';
import 'package:fluxo/shared/controllers/controller_recipe.dart';
import 'package:fluxo/shared/controllers/controller_type_expense.dart';
import 'package:fluxo/shared/controllers/controller_type_recipe.dart';
import 'package:fluxo/shared/controllers/controller_user.dart';
import 'package:fluxo/shared/models/user.dart';
import 'package:fluxo/shared/utils/components/form.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerPassword = new TextEditingController();
  TextEditingController _controllerName = new TextEditingController();
  ControllerUser _controller = new ControllerUser();
  ControllerTypeExpense _controllerTypeExpense = new ControllerTypeExpense();
  ControllerTypeRecipe _controllerTypeRecipe = new ControllerTypeRecipe();
  ControllerExpense _controllerExpense = new ControllerExpense();
  ControllerRecipe _controllerRecipe = new ControllerRecipe();

  @override
  void initState() {
    super.initState();
    this._controller.init();
    this._controllerTypeExpense.init();
    this._controllerTypeRecipe.init();
    this._controllerExpense.init();
    this._controllerRecipe.init();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
      ),
      body: _body(),
      bottomNavigationBar: _buttonRegister(),
    );
  }




  Widget _body() {
    return Column(
      children: [
        _name(),
        _email(),
        _password(),

      ],
    );
  }

  Widget _password() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Senha",
        hintText: "Digite a senha",
        line: 1,
        controller: _controllerPassword,
        obscureText: true,
        textInputType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget _email() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Email",
        hintText: "Digite o email",
        line: 1,
        controller: _controllerEmail,
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
        controller: _controllerName,
        textInputType: TextInputType.name,
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            String email = _controllerEmail.text;
            String password = _controllerPassword.text;
            String name = _controllerName.text;
            User data = new User(null, email, password, name);
            this._controller.insert(data);
            this.clean();
            Navigator.pop(context);
          },
          child: Text("CADASTRAR", style: TextStyle(color: Colors.white))),
    );
  }

  void clean() {
    FocusScope.of(context).unfocus();
    this._controllerName.text = "";
    this._controllerPassword.text = "";
    this._controllerEmail.text = "";
    _controllerTypeExpense.deleteAll();
    _controllerTypeRecipe.deleteAll();
    _controllerRecipe.deleteAll();
    _controllerExpense.deleteAll();
  }



}
