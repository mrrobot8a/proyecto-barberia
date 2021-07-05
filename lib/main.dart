import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Inicio/inicio.dart';
import 'package:flutter_auth/constants.dart';

import 'Screens/Barbero/inicioBarbero.dart';
import 'Screens/Barbero/listarturnos.dart';
import 'Screens/Barbero/mainBarbero.dart';
import 'Screens/Usuario/inicioUsuario.dart';
import 'Screens/Usuario/mainUsuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barberia',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ListaEmpleado(),
    );
  }
}
