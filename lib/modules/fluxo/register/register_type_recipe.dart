import 'package:flutter/material.dart';
import 'package:fluxo/shared/controllers/controller_type_recipe.dart';
import 'package:fluxo/shared/models/type_recipe.dart';
import 'package:fluxo/shared/utils/components/form.dart';

class RegisterTypeRecipe extends StatefulWidget {
  @override
  _RegisterTypeRecipeState createState() => _RegisterTypeRecipeState();
}

class _RegisterTypeRecipeState extends State<RegisterTypeRecipe> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  ControllerTypeRecipe _controller = new ControllerTypeRecipe();
  List<TypeRecipe> list = [];

  @override
  void initState() {
    super.initState();
    this._controller.init().then((value) {
      this.findAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro Tipo Receita"),
        ),
        body: SingleChildScrollView(child: this._body()));
  }

  Widget _body() {
    return Column(children: [
      _name(),
      _description(),
      _buttonInsert(),
      Text("TIPOS CADASTRADOS", textAlign: TextAlign.start),
      _list()
    ]);
  }

  Widget _list() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(bottom: 15),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index].id.toString();
          return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                this._controller.delete(list[index]);
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
                  title: Text('${list[index].name}'),
                  subtitle: Text('${list[index].description}'),
                )),
              ));
        });
  }

  Widget _buttonInsert() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(25),
      height: 50,
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

  void findAll() {
    this._controller.findAll().then((value) {
      setState(() {
        this.list = value;
      });
    });
  }

  void insert() {
    TypeRecipe typeRecipe = new TypeRecipe(
        null, this._nameController.text, this._descriptionController.text);
    this._controller.insert(typeRecipe);
    this._showMessage("Tipo inserido com sucesso!");
    this.clean();
    this.findAll();
  }

  void clean() {
    FocusScope.of(context).unfocus();
    this._descriptionController.text = "";
    this._nameController.text = "";
  }

  void _showMessage(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.green);
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
