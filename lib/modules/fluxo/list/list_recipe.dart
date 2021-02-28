import 'package:flutter/material.dart';
import 'package:fluxo/shared/controllers/controller_recipe.dart';
import 'package:fluxo/shared/controllers/controller_type_recipe.dart';
import 'package:fluxo/shared/models/recipe.dart';

class ListRecipe extends StatefulWidget {
  @override
  _ListRecipeState createState() => _ListRecipeState();
}

class _ListRecipeState extends State<ListRecipe> {
  ControllerRecipe _controller = new ControllerRecipe();
  List<Recipe> _list = [];

  @override
  void initState() {
    super.initState();

    this._controller.init().then((value) {
      findAll();
    });
  }

  void findAll() {
    this._controller.findAll().then((value) {
      setState(() {
        this._list = value;
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
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.pushNamed(context, 'register/recipe')
                .then((value) => this.findAll());
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(child: this._listRecipe()));
  }

  Widget _listRecipe() {
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
}
