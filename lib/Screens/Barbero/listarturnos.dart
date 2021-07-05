import 'package:flutter/material.dart';
import 'package:flutter_auth/modelos/turno.dart';

import 'package:flutter_auth/peticiones/usuariohttp.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class ListaEmpleado extends StatefulWidget {
  ListaEmpleado({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ListaEmpleadoState createState() => _ListaEmpleadoState();
}

class _ListaEmpleadoState extends State<ListaEmpleado> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isVisible = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de los empleados'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                getInfo(context);
              });
            },
            tooltip: 'Refrescar',
          )
        ],
      ),

      body: getInfo(context),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => null
                //Llamar la Vista TextoEjercicio
                ),
          );
        },
        tooltip: 'Adicionar Cliente',
        child: Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VistaEmpleado extends StatelessWidget {
  final List<Turno> empleado;

  const VistaEmpleado({Key key, this.empleado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: empleado == null ? 0 : empleado.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              /*
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => (
                           )));*/
            },
            leading: Container(
              padding: EdgeInsets.all(5.0),
              width: 50,
              height: 50,
              child: Image.network(""),
            ),
            title: Text(empleado[posicion].nombre),
            subtitle: Text(
              empleado[posicion].numeroTurno,
              style: TextStyle(color: Colors.blue),
            ),
            trailing: Container(
              width: 100,
              height: 40,
              color: Colors.greenAccent,
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(empleado[posicion].nombre),
            ),
          );
        });
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarPosts(http
        .Client()), //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? VistaEmpleado(empleado: snapshot.data)
              : Text(
                  snapshot.data != null
                      ? 'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}'
                      : 'Vuelve a intentar',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                );

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}
