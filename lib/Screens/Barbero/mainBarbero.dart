
import 'package:flutter/material.dart';
//import 'package:flutter_auth/Screens/Admin/perfilBarberia.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_auth/Screens/Admin/perfilBarberia.dart';
import 'package:flutter_auth/Screens/Barbero/perfilBarberoBarbero.dart';
import 'package:flutter_auth/modelos/usuario.dart';
import '../../constants.dart';
import 'inicioBarbero.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainBarbero extends StatefulWidget {
  final String user;
  MainBarbero({Key key, this.user}) : super(key: key);
  // variables que resivo de la otra vista
  @override
  _MainBarberoState createState() => _MainBarberoState();
}

class _MainBarberoState extends State<MainBarbero> {

  List data = List();

  Future<List> loginE( user) async {
    var url = Uri.parse(
        "http://gestiondeturnosbarberia.000webhostapp.com/filtradoUsuario.php");

    final response = await http.post(url, body: {
      "identificacion": user,
    });

    var dataUser = json.decode(response.body);
    print(dataUser);
    setState(() {
      data = dataUser;
      print(data);
    });

    return dataUser;
  }

  @override
  void initState() {
    this.loginE(widget.user);
    super.initState();
  }
  // This widget is the root of your application.
  int _pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  //final Galeria _inicio = new Galeria();
  //final PerfilBarberoBarbero _perfil = new 
  final InicioBarbero _inicio = new InicioBarbero();
  Widget _showPage = new InicioBarbero();
  
  //Widget _showPage = new Galeria();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _inicio;
        break;
      case 1:
        
        //print("identificacion   "+ widget.user);
        //print("Datos   "+ data.toString());
        return PerfilBarberoBarbero(perfil:data ,idBarbero: widget.user);
        
        break;
      default:
        return new Container(
          child: Center(
              child: new Text(
            'NO page no found.',
          )),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Barbershop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          backgroundColor: kPrimaryLightColor,
          color:kPrimaryColor,
          animationDuration: Duration(milliseconds: 800),
          index: _pageIndex,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 30, color:Colors.white),
            Icon(Icons.person, size: 30,color:Colors.white),
            Icon(Icons.turned_in_not, size: 30,color:Colors.white),
          ],
          onTap: (tapindex) {
            setState(() {
              _showPage = _pageChooser(tapindex);
            });
          },
        ),
        body: _showPage,
      ),
    );
  }
}