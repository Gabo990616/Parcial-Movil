import 'package:flutter/material.dart';
import 'package:parcial1/src/Paginas/home.dart';
import 'package:parcial1/src/Paginas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Main',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => Login(),
        'home' : (BuildContext context) => Home(''),

      },



    );
  }
}
