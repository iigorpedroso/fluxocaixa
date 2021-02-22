import 'package:flutter/material.dart';
import 'package:fluxo/shared/controllers/controller_type_recipe.dart';
import 'package:fluxo/shared/models/type_recipe.dart';

class ListTypeRecipe extends StatefulWidget {
  @override
  _ListTypeRecipeState createState() => _ListTypeRecipeState();
}

class _ListTypeRecipeState extends State<ListTypeRecipe> {
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
          title: Text("Tipo Receita"),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.pushNamed(context, 'register/typerecipe')
                .then((value) => this.findAll());
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(child: this._list()));
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

  void findAll() {
    this._controller.findAll().then((value) {
      setState(() {
        this.list = value;
      });
    });
  }



  void _showMessage(String message) {
    final snackBar =
        SnackBar(content: Text(message), backgroundColor: Colors.green);
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
