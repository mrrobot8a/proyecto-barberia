import 'package:flutter/material.dart';
import 'package:flutter_auth/peticiones/usuariohttp.dart';
import 'package:intl/intl.dart';

import 'package:ticket_pass_package/ticket_pass.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class TurnoUsuario extends StatefulWidget {
  final idUsuario;
  final List perfil;
  const TurnoUsuario({Key key, this.idUsuario, this.perfil}) : super(key: key);

  @override
  _TurnoUsuarioState createState() => _TurnoUsuarioState();
}

String identificacion = "";
String nombreUsuario = "";
String telefono = "";
String correo = "";
String rutaFoto = "";

class _TurnoUsuarioState extends State<TurnoUsuario> {
  int _cIndex = 0;

  List data = List();
  int numero;
  var validar;

  Future<List> loginE() async {
    var url = Uri.parse(
        "https://gestiondeturnosbarberia.000webhostapp.com/turno.php");

    final response = await http.post(url, body: {});

    var dataUser = json.decode(response.body);
    print(dataUser);
    setState(() {
      data = dataUser;
      print(data);
      numero = int.parse(dataUser[0]['TOTAL']);
      numero = numero + 1;
      validar = numero;
      print(numero);
      print("HOLA" + dataUser[0]['TOTAL']);
    });

    return dataUser;
  }

  @override
  void initState() {
    this.loginE();
    super.initState();
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  _mas() {
    setState(() {
      numero++;
    });
  }

  _menos() {
    setState(() {
      if (validar < numero) {
        numero--;
      }
    });
  }

  List<String> sample = <String>[
    'Sample data 1',
    'Sample data 2',
    'Sample data 3',
    'Sample data 4',
    'Sample data 5',
    'Sample data 6',
    'Sample data 7',
    'Sample data 8'
  ];

  List<String> example = <String>[
    'jhona',
    'Sample data 2',
    'Sample data 3',
    'Sample data 4',
    'Sample data 5',
    'Sample data 6',
    'Sample data 7',
    'Sample data 8'
  ];

  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    recorrerLista(widget.perfil);
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPrevButton(),
          SizedBox(
            width: 0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: TicketPass(
                    animationDuration: Duration(seconds: 2),
                    expandedHeight: 400,
                    expandIcon: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 20,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    expansionTitle: Text(
                      'Purchased By',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    purchaserList: sample,
                    separatorColor: Colors.black,
                    separatorHeight: 2.0,
                    color: Colors.white,
                    curve: Curves.easeOut,
                    titleColor: Colors.orange,
                    shrinkIcon: Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        maxRadius: 20,
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    ticketTitle: Text(
                      'Turno',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    //tamaño de panel del tirulo de abajo
                    titleHeight: 70,
                    //tamaño de ticket
                    width: 315,
                    height: 240,
                    shadowColor: Colors.orange.withOpacity(0.5),
                    elevation: 8,
                    shouldExpand: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5),
                      child: Container(
                        height: 140,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Nombre",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                            Text(
                                              nombreUsuario,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Turno',
                                              style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                            Text(
                                              'Barber Shop',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Fecha',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                          ),
                                          Text(
                                            formattedDate,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'N° TURNO',
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                          ),
                                          Text(
                                            '$numero',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  child: Text("Agregar turno".toUpperCase(),
                      style: TextStyle(fontSize: 20)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15)),
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: () {
                    String tempAge = numero.toString();
                    adicionarturno(
                      "jhon",
                      tempAge,
                    );
                    _mas();
                  }),
            ],
          ),
          _buildNextButton(),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return new Padding(
      padding: EdgeInsets.only(left: 0),
      child: IconButton(
        alignment: Alignment.center,
        iconSize: 20,
        onPressed: () {
          print("Next");
          setState(() {
            if (_cIndex < example.length - 1) {
              _cIndex++;
            }
            _mas();
          });
        },
        icon: Icon(
          Icons.navigate_next,
          size: 20.0,
        ),
        color: Colors.grey,
      ),
    );
  }

  Widget _buildPrevButton() {
    return new Padding(
      padding: EdgeInsets.only(left: 0),
      child: IconButton(
        iconSize: 20,
        onPressed: () {
          setState(() {
            if (_cIndex > 0) {
              _cIndex--;
            }
            _menos();
          });
        },
        icon: Icon(
          Icons.navigate_before,
          color: Colors.grey,
          size: 20.0,
        ),
      ),
    );
  }
}

void recorrerLista(List<dynamic> list) {
  print(list.toString());

  for (var i = 0; i < list.length; i++) {
    identificacion = list[i]["identificacion"];
    nombreUsuario = list[i]["nombreUsuario"];
    correo = list[i]["correo"];
    telefono = list[i]["telefono"];
    rutaFoto = list[i]["rutaFoto"];
  }

  print("2 " + rutaFoto);
}
