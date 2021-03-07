import 'package:flutter/material.dart';
import 'package:fluxo/shared/controllers/controller_user.dart';
import 'package:fluxo/shared/models/user.dart';
import 'package:fluxo/shared/utils/components/form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ControllerUser _controllerUser = new ControllerUser();


  @override
  void initState() {
    super.initState();
    this._controllerUser.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2 - 230),
            child: _body(),
          ),
        )
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/user.png'),
        Text("Seja Bem Vindo!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        Text("Faça o login para continuar",
            style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15)),
        _email(),
        _password(),
        _button(),
        _register(),
      ],
    );
  }

  Widget _register() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GestureDetector(
        child: Text("Não possui registro? \n Registrar",
            textAlign: TextAlign.center),
        onTap: () {
          Navigator.pushNamed(context, 'register');
        },
      ),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      height: 50,
      padding: EdgeInsets.only(left: 25, right: 25),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          child: Text("LOGIN"),
          onPressed: _login),
    );
  }

  void _login() async {
    if (_emailController.text != "" || _passwordController.text != "") {
      
      User user = await this._controllerUser.findByEmail(_emailController.text);

      if (user != null) {

        if (user.password == _passwordController.text) {
          Navigator.pushReplacementNamed(context, 'fluxo/home');
        } else
          this._showMessage("Senha incorreta!", Colors.red);
      } else
        this._showMessage("Usuário não encontrado", Colors.red);
    } else
      this._showMessage("Informe os dados corretamente", Colors.red);
  }

  Widget _password() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Senha",
        hintText: "Digite sua senha",
        line: 1,
        controller: _passwordController,
        obscureText: true,
        textInputType: TextInputType.visiblePassword,
      ),
    );
  }

  Widget _email() {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 25, right: 25),
      child: FormDataField(
        label: "Email",
        hintText: "Digite seu email",
        line: 1,
        controller: _emailController,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  void _showMessage(String message, Color color) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(message), backgroundColor:  color));
  }
}
