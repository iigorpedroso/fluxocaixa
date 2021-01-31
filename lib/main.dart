import 'package:flutter/material.dart';
import 'package:fluxo/modules/fluxo/fluxo_page.dart';
import 'package:fluxo/modules/home/login/login_page.dart';
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
    },
  ));
}

