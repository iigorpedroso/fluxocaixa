import 'package:flutter/material.dart';
import 'package:fluxo/shared/utils/components/form.dart';



class RegisterRecipe extends StatefulWidget {
  @override
  _RegisterRecipeState createState() => _RegisterRecipeState();
}

class _RegisterRecipeState extends State<RegisterRecipe> {
  TextEditingController _observationController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _valueController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro Receitas"),
        ),
        body: SingleChildScrollView(child: this._body()));
  }

  Widget _body() {
    return Column(
      children: [
        _type(),
        _observation(),
        _date(),
        _value(),
        _buttonInsert(),
        _list()
      ],
    );
  }


  Widget _list() {
    return Container();
  }

  Widget _value() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Valor",
        hintText: "Digite o valor",
        line: 1,
        controller: _valueController,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }



  Widget _date() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Data",
        hintText: "Digite a data",
        line: 1,
        controller: _dateController,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _observation() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        label: "Descrição",
        hintText: "Digite a descrição",
        line: 3,
        controller: _observationController,
        textInputType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _type() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: DropdownButton(
        onChanged: (value) {},
        items: [],
      )
    );
  }

  Widget _buttonInsert() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      height: 50,
      child: RaisedButton(
          color: Colors.blue,
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white)),
    );
  }

}
