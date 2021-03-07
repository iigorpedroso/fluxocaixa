import 'package:flutter/material.dart';
import 'package:fluxo/modules/fluxo/fluxo_page.dart';
import 'package:fluxo/modules/fluxo/list/list_type_expense.dart';
import 'package:fluxo/modules/fluxo/list/list_type_recipe.dart';
import 'package:fluxo/modules/fluxo/register/register_expense.dart';
import 'package:fluxo/modules/fluxo/register/register_recipe.dart';
import 'package:fluxo/modules/fluxo/register/register_type_expense.dart';
import 'package:fluxo/modules/fluxo/register/register_type_recipe.dart';
import 'package:fluxo/modules/fluxo/reports/reports_fluxo.dart';
import 'package:fluxo/modules/home/login/login_page.dart';
import 'package:fluxo/modules/home/login/register_page.dart';
import 'package:fluxo/modules/home/splash/splash_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Fluxo Caixa",
    initialRoute: "/",
    theme: ThemeData(primaryColor: Colors.blue),
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => LoginPage(),
      'splash': (context) => SplashPage(),
      'fluxo/home': (context) => FluxoHomePage(),
      'list/typeexpense': (context) => ListTypeExpense(),
      'list/typerecipe': (context) => ListTypeRecipe(),
      'reports': (context) => ReportsFluxo(),
      'register': (context) => RegisterPage(),
      'register/expense': (context) => RegisterExpense(),
      'register/recipe': (context) => RegisterRecipe(),
      'register/typeexpense': (context) => RegisterTypeExpense(),
      'register/typerecipe': (context) => RegisterTypeRecipe(),
    },
  ));
}

