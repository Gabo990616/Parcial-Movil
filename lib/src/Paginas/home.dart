import 'package:flutter/material.dart';
import 'package:parcial1/src/Paginas/adicionar.dart';
import 'package:parcial1/src/Paginas/modificar.dart';
import 'package:parcial1/src/modelos/persona.dart';

class Home extends StatefulWidget {
  Home(@required this.usuario);
  String usuario;
  @override
  _HomeState createState() => _HomeState(usuario);
}

class _HomeState extends State<Home> {
  @override
  _HomeState(this.usuario);
  String usuario;
  List personas = personasL;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          fondo(),
          menuSuperior(context),
          listarPersonas(context),
          adicionarButton(context),
        ],
      ),
    ));
  }

  Widget adicionarButton(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 60, left: 20),
        alignment: AlignmentDirectional(0.8, 1),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    Adicionar("Adicionar"), //Llamar la Vista TextoEjercicio
              ),
            ).then((resultado) //Espera por un Resultado
                {
              personas.addAll(
                  resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
              setState(() {});
            });
          },
          tooltip: 'Adicionar Persona',
          child: Icon(Icons.add),
        ));
  }

  Widget listarPersonas(context) {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: ListView.builder(
            itemCount: personas.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    personas[index].nombre + ' ' + personas[index].apellido,
                    style: TextStyle(color: Colors.white)),
                subtitle: Text(personas[index].profesion,
                    style: TextStyle(color: Colors.white)),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/89478610?v=4'),
                ),
                trailing: Text(
                    'fecha: ' +
                        personas[index].fechaNac +
                        ' Edad: ' +
                        personas[index].edad.toString(),
                    style: TextStyle(color: Colors.white)),
                onLongPress: () {
                  setState(() {
                    opcionPersona(context, personas[index], personas, index);
                  });
                },
              );
            }));
  }

  opcionPersona(context, Persona persona, personas, index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Opcion'),
        content: Text('Que desea hacer con: ' + persona.nombre + '?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                this.personas.remove(persona);
              });
              Navigator.pop(context);
            },
            child: Text(
              'Eliminar',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Modificar(persona.nombre, persona),
                ),
              ).then((resultado) {
                persona = resultado;
                setState(() {
                  personas[index] = resultado;
                  this.personas = personas;
                  Navigator.pop(context);
                });
              });
            },
            child: Text(
              'Modificar',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
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
                    'Home',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Text(
                    usuario,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ]),
          ))
    ]);
  }

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
