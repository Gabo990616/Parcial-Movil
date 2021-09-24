import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parcial1/src/Paginas/home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [fondo(), log(context)],
    ));
  }

  String usuarioValx = "";
  String passwordValx = "";

  Widget log(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(children: [
      SafeArea(
          child: Container(
        height: 90,
      )),
      Container(
          width: size.width * 0.85,
          padding: EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(15, 70, 219, 1),
                  Color.fromRGBO(0, 31, 115, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(3, 3),
                    spreadRadius: 3.0),
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(-3, -3),
                    spreadRadius: 3.0)
              ]),
          child: Column(
            children: [
              foto(),
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 18.0, fontFamily: 'Arial', color: Colors.white),
              ),
              usuario(),
              SizedBox(height: 10),
              password(),
              button(context)
            ],
          ))
    ]));
  }

  Container foto() {
    return Container(
     /* decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),*/
        padding: EdgeInsets.all(15.0),
        width: 200,
        height: 200,
        child: CircleAvatar(
         // radius: 20,
          backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/89478610?v=4'),
        ));
  }

  Container button(context) => Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(3, 3),
            spreadRadius: 2.0),
        BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
            offset: Offset(-3, -3),
            spreadRadius: 2.0)
      ]),
      child: ElevatedButton(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Ingresar')),
          onPressed: () {
            if (usuarioValx.isNotEmpty && passwordValx.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home(usuarioValx)),
              );
            } else
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                        backgroundColor: Colors.blue,
                        elevation: 3.0,
                        title: Text("Alerta"),
                        content: Text('Llene todos los campos'));
                  });
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(41, 79, 150, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))))));

  Container password() => Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
          onChanged: (texto) {
            passwordValx = texto;
          },
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock_outline, color: Colors.white),
            hintText: '*********',
            labelText: 'Contraseña',
            hintStyle: TextStyle(color: Colors.black),
            labelStyle: TextStyle(color: Colors.white),
          )));

  Container usuario() => Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        onChanged: (texto) {
          usuarioValx = texto;
        },
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          icon: Icon(Icons.account_circle, color: Colors.white),
          hintText: 'myUserAccount',
          labelText: 'Nombre de Usuario',
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ));

  Widget fondo() {
    return fondito();
  }

  Container fondito() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[
          Color.fromRGBO(0, 31, 115, 1),
          Color.fromRGBO(15, 70, 219, 1),
        ],
      )),
    );
  }
}
