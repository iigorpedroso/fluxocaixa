import 'package:flutter/material.dart';
import 'package:fluxo/shared/controllers/controller_type_expense.dart';
import 'package:fluxo/shared/models/type_expense.dart';



class ListTypeExpense extends StatefulWidget {
  @override
  _ListTypeExpenseState createState() => _ListTypeExpenseState();
}

class _ListTypeExpenseState extends State<ListTypeExpense> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  ControllerTypeExpense _controller = new ControllerTypeExpense();
  List<TypeExpense> list = [];

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
          title: Text("Tipo Gasto"),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.pushNamed(context, 'register/typeexpense')
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

  void insert() {
    TypeExpense typeRecipe = new TypeExpense(
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
