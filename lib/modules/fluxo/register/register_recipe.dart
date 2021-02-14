import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxo/shared/controllers/controller_recipe.dart';
import 'package:fluxo/shared/controllers/controller_type_recipe.dart';
import 'package:fluxo/shared/models/recipe.dart';
import 'package:fluxo/shared/models/type_recipe.dart';
import 'package:fluxo/shared/utils/components/CurrencyInputFormatter.dart';
import 'package:fluxo/shared/utils/components/form.dart';

class RegisterRecipe extends StatefulWidget {
  @override
  _RegisterRecipeState createState() => _RegisterRecipeState();
}

class _RegisterRecipeState extends State<RegisterRecipe> {
  TextEditingController _controllerTypeRecipe = new TextEditingController();
  TextEditingController _observationController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _hourController = new TextEditingController();
  TextEditingController _valueController = new TextEditingController();
  ControllerRecipe _controller = new ControllerRecipe();
  List<Recipe> _list = [];
  List<TypeRecipe> _typeRecipe = [];
  ControllerTypeRecipe _controllerTypesRecipe = new ControllerTypeRecipe();

  @override
  void initState() {
    super.initState();

    this._controller.init().then((value) {
      findAll();
    });

    getAllType();
  }

  void findAll() {
    this._controller.findAll().then((value) {
      setState(() {
        this._list = value;
      });
    });
  }

  void getAllType() {
    this._controllerTypesRecipe.init().then((value) {
      this._controllerTypesRecipe.findAll().then((value) {
        setState(() {
          this._typeRecipe = value;
        });
      });
    });
  }

  void _showMessage(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.green);
    Scaffold.of(context).showSnackBar(snackBar);
  }

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
        _dateAndHours(),
        _value(),
        _buttonInsert(),
        _listRegister()
      ],
    );
  }

  Widget _dateAndHours() {
    return Row(
      children: [
        Expanded(
          child: _date(),
        ),
        Center(
            child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(":", style: TextStyle(fontSize: 30)),
        )),
        Expanded(
          child: _hours(),
        ),
      ],
    );
  }

  Widget _listRegister() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(bottom: 15),
        itemCount: _list.length,
        itemBuilder: (context, index) {
          final item = _list[index].id.toString();
          return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                this._controller.delete(_list[index]);
                this.findAll();
                this._showMessage("Apagado com sucesso!");
              },
              background: Container(
                padding: EdgeInsets.only(right: 20.0),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Text(
                  'Deletar',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 7.5),
                child: Card(
                    child: ListTile(
                  title: Text('R\$ ${_list[index].value}'),
                  subtitle: Text('${_list[index].description}'),
                )),
              ));
        });
  }

  Widget _value() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 25, right: 25),
      child: FormDataField(
        textInputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CurrencyInputFormatter(maxDigits: 8)
        ],
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
        child: FormDate(
            label: "Data",
            suffix: "Data",
            controller: _dateController,
            validator: (String value) {
              if (value.isEmpty) return "Campo Obrigatório!";
              return null;
            }));
  }

  Widget _hours() {
    return Padding(
        padding: EdgeInsets.only(top: 20, left: 25, right: 25),
        child: FormHours(
            label: "Horário",
            suffix: "Horário",
            controller: _hourController,
            validator: (String value) {
              if (value.isEmpty) return "Campo Obrigatório!";
              return null;
            }));
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
        child: DropDownButton(
          items: this._typeRecipe,
          controller: _controllerTypeRecipe,
          hintText: "Selecionar Tipo Receita",
        ));
  }

  void clean() {
    FocusScope.of(context).unfocus();
    this._controllerTypeRecipe.text = "";
    this._observationController.text = "";
    this._hourController.text = "";
    this._dateController.text = "";
    this._valueController.text = "";
    this._controllerTypeRecipe.text = "";
  }

  Widget _buttonInsert() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      height: 50,
      child: RaisedButton(
          color: Colors.blue,
          onPressed: () {
            int type = int.parse(_controllerTypeRecipe.text);
            String description = _observationController.text;
            String hour = _hourController.text;
            List<String> dateStr = _dateController.text.split("/");
            DateTime dateTime = DateTime.parse(
                dateStr[2] + '-' + dateStr[1] + '-' + dateStr[0] + " " + hour);
            double value = double.parse(_valueController.text
                .replaceAll("R\$ ", "")
                .replaceAll(",", "."));
            Recipe data = new Recipe(null, type, description, dateTime, value);
            this._controller.insert(data);
            this._showMessage("Inserido com sucesso!");
            this.clean();
            this.findAll();
          },
          child: Icon(Icons.add, color: Colors.white)),
    );
  }
}
