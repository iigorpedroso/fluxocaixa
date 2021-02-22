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


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
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
          bottomMenuOption(Icons.attach_money_sharp, "Tipo Receitas"),
          bottomMenuOption(Icons.attach_money_sharp, "Tipo Gastos"),
          bottomMenuOption(Icons.list, "Relatórios"),
        ],
        currentIndex: _index,
        onTap: (index) {
          if (index != _index) {
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
}
