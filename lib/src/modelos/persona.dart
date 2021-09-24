class Persona {
  var foto;
  var nombre;
  var apellido;
  var profesion;
  var fechaNac;
  var edad;

  Persona(
      {this.foto,
      this.nombre,
      this.apellido,
      this.profesion,
      this.fechaNac,
      this.edad});
}

List<Persona> personasL = [
  Persona(
      foto: 'as',
      nombre: 'Gabriel',
      apellido: 'Rodriguez',
      profesion: 'Estudiante',
      fechaNac: '16/6/1999',
      edad: calcEdad('16/6/1999')),
  Persona(
      foto: 'as',
      nombre: 'Robert',
      apellido: 'Ayala',
      profesion: 'Estudiante',
      fechaNac: '11/10/1999',
      edad: calcEdad('11/10/1999')),
  Persona(
      foto: 'as',
      nombre: 'Viana',
      apellido: 'Jacomino',
      profesion: 'Estudiante',
      fechaNac: '14/2/2000',
      edad: calcEdad('14/2/2000')),
];

int calcEdad(String fecha) {
  DateTime fechaAct = DateTime.now();
  int dia = fechaAct.day;
  int mes = fechaAct.month;
  int anno = fechaAct.year;

  int diaf;
  int mesf;
  int annof;
  String cant = fecha.substring(9);
  int edad;
  if (cant != '') {
    diaf = int.parse(fecha.substring(0, 2));
    mesf = int.parse(fecha.substring(3, 5));
    annof = int.parse(fecha.substring(6));
  } else {
    diaf = int.parse(fecha.substring(0, 2));
    mesf = int.parse(fecha.substring(3, 4));
    annof = int.parse(fecha.substring(5, 9));
  }
  if ((mes > mesf) || ((mes == mesf) && (dia >= diaf))) {
    edad = anno - annof;
  } else {
    edad = anno - annof - 1;
  }

  return edad;
}
