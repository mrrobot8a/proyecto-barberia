import 'package:flutter_auth/Screens/Admin/inicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/perfilBarberia.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_auth/Screens/Admin/registrarBarbero.dart';
import '../../constants.dart';


class MainAdmin extends StatefulWidget {
  // variables que resivo de la otra vista
  @override
  _MainAdminState createState() => _MainAdminState();
}

class _MainAdminState extends State<MainAdmin> {
  // This widget is the root of your application.
  GlobalKey _bottomNavigationKey = GlobalKey();
  //final Galeria _inicio = new Galeria();
  final PerfilBarberia _perfil = new PerfilBarberia();
  final AgregarBarbero _agregarBarbero = new AgregarBarbero();
  final Inicio _inicio = new Inicio();
  Widget _showPage = new Inicio();
  
  //Widget _showPage = new Galeria();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _inicio;
        break;
      case 1:
        return _agregarBarbero;
        break;
      case 2:
        return _perfil;
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
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          
          height: 50.0,
          backgroundColor: kPrimaryLightColor,
          color:kPrimaryColor,
          animationDuration: Duration(milliseconds: 1200),
          animationCurve: Curves.easeInOut,
          index: 0,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.home, size: 20, color:Colors.white),
            Icon(Icons.app_registration, size: 20,color:Colors.white),
            Icon(Icons.person, size: 20,color:Colors.white),
          ],
          onTap: (int tapindex) {
            setState(() {
              _showPage = _pageChooser(tapindex);
            });
          },
        ),
        body: _showPage,
      );
    
  }
}