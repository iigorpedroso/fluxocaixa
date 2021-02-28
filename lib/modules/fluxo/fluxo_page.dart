import 'package:flutter/material.dart';
import 'package:fluxo/modules/fluxo/home/main_fluxo.dart';
import 'package:fluxo/modules/fluxo/list/list_expense.dart';
import 'package:fluxo/modules/fluxo/list/list_recipe.dart';
import 'package:fluxo/modules/fluxo/list/list_type_expense.dart';
import 'package:fluxo/modules/fluxo/list/list_type_recipe.dart';
import 'package:fluxo/modules/fluxo/reports/reports_fluxo.dart';

class FluxoHomePage extends StatefulWidget {
  @override
  _FluxoHomePageState createState() => _FluxoHomePageState();
}

class _FluxoHomePageState extends State<FluxoHomePage> {
  int _index = 0;
  String title = "PRINCIPAL";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: _menu(),
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _index,
        children: [
          MainFluxo(),
          ListRecipe(),
          ListExpense(),
          ListTypeRecipe(),
          ListTypeExpense(),
          ReportsFluxo()
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _menu() {
    return Drawer(
      child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Fluxo App"),
          accountEmail: Text("Aplicativo de apoio financeiro"),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          currentAccountPicture: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/images/user.png'),
            backgroundColor: Colors.transparent,
          ),
        ),
        _optionsMenu(Icons.bar_chart, "Relatórios", () {
          Navigator.pushNamed(context, 'reports');
        }),
        _optionsMenu(Icons.monetization_on, "Tipo de Receita", () {
          Navigator.pushNamed(context, 'list/typerecipe');
        }),
        _optionsMenu(Icons.attach_money_sharp, "Tipo de Gastos", () {
          Navigator.pushNamed(context, 'list/typeexpense');
        }),
      ]),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1, color: Theme.of(context).accentColor))),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: <BottomNavigationBarItem>[
          bottomMenuOption(Icons.home, "Principal"),
          bottomMenuOption(Icons.monetization_on, "Receitas"),
          bottomMenuOption(Icons.monetization_on_outlined, "Gastos"),
        ],
        currentIndex: _index,
        onTap: (index) {
          if (index != _index) {
            this.title = index == 0 ?  "Principal" : index == 1 ? "Receitas" : "Gastos";
            setState(() {
              _index = index;
            });
          }
        },
      ),
    );
  }

  BottomNavigationBarItem bottomMenuOption(IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: text,
    );
  }

  Widget _optionsMenu(IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
