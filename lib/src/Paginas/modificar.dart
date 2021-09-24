import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parcial1/src/modelos/persona.dart';

class Modificar extends StatefulWidget {
  Modificar(this.title, this.persona);
  String title;
  Persona persona = Persona();

  @override
  _ModificarState createState() => _ModificarState(title, persona);
}

class _ModificarState extends State<Modificar> {
  _ModificarState(this.title, this.personaC);
  String title;
  List<Persona> personasadd = [];
  Persona personaC;
  var foto;
  var nombre;
  var apellido;
  var profesion;
  var fechaNac;
  var edad;

  late TextEditingController controladorfoto;
  late TextEditingController controladornombre;
  late TextEditingController controladorapellido;
  late TextEditingController controladorprofesion;
  late TextEditingController controladorfechanac;

  @override
  void initState() {
    controladorfoto = TextEditingController();
    controladornombre = TextEditingController();
    controladorapellido = TextEditingController();
    controladorprofesion = TextEditingController();
    controladorfechanac = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(child: Stack(children: [fondo(), menuSuperior(context)])),
        Column(
          children: [
            pNombre(),
            pApellido(),
            pProfesion(),
            pFechaNac(),
            guardarButton(context),
          ],
        ),
      ]),
    );
  }

  Widget guardarButton(BuildContext context) {
    return Container(
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
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(41, 79, 150, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
          onPressed: () {
            if (controladornombre.text.isNotEmpty &&
                controladorapellido.text.isNotEmpty &&
                controladorprofesion.text.isNotEmpty &&
                controladorfechanac.text.isNotEmpty) {
              this.personaC = Persona(
                  foto: controladorfoto.text,
                  nombre: controladornombre.text,
                  apellido: controladorapellido.text,
                  profesion: controladorprofesion.text,
                  fechaNac: controladorfechanac.text,
                  edad: calcEdad(controladorfechanac.text));

              Navigator.pop(context, personaC);
            }
          },
          child: Text('Guardar Datos'),
        ));
  }

  Widget pNombre() => Container(
      margin: EdgeInsets.only(top: 60),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: controladornombre,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.white24,
              labelText: 'Nombres',
              suffix: GestureDetector(
                child: Icon(Icons.account_circle_rounded, color: Colors.white),
                onTap: () {
                  controladornombre.clear();
                },
              )),
        ),
      ));
  Padding pApellido() => Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: controladorapellido,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.white24,
              labelText: 'Apellido',
              suffix: GestureDetector(
                child: Icon(Icons.account_circle_outlined, color: Colors.white),
                onTap: () {
                  controladorapellido.clear();
                },
              )),
        ),
      );
  Padding pProfesion() => Padding(
        padding: EdgeInsets.all(15.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: controladorprofesion,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.white24,
              labelText: 'Profesion',
              suffix: GestureDetector(
                child: Icon(Icons.work_outline_rounded, color: Colors.white),
                onTap: () {
                  controladorprofesion.clear();
                },
              )),
        ),
      );
  Padding pFechaNac() => Padding(
      padding: EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () {
          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 100),
                  lastDate: DateTime.now())
              .then((value) => controladorfechanac.text =
                  '${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}');
        },
        child: TextField(
          style: TextStyle(color: Colors.white),
          controller: controladorfechanac,
          enabled: false,
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.white24,
              labelText: 'Fecha de Nacimiento',
              suffix: GestureDetector(
                child: Icon(Icons.date_range_rounded, color: Colors.white),
                onTap: () {
                  controladorfechanac.clear();
                },
              )),
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

  Widget menuSuperior(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
          width: size.width * 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(15, 70, 219, 1),
                  Color.fromRGBO(0, 31, 115, 1),
                ],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(3, 3),
                    spreadRadius: 3.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ]),
          ))
    ]);
  }
}
