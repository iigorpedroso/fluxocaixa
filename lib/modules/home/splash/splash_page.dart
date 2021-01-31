import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => {
      Navigator.pushReplacementNamed(context, 'fluxo/home')
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/balance.png'),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text("FLUXO",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w100)),
            )
          ],
        ),
      ),
    );
  }



}
