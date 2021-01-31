import 'package:flutter/material.dart';
import 'package:fluxo/shared/utils/components/form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: _body(),
    ));
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
        _button()
      ],
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
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'splash');
        },
      ),
    );
  }

  Widget _password() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Senha",
        hintText: "Digite sua senha",
        line: 1,
        controller: _emailController,
        textInputType: TextInputType.emailAddress,
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
}
