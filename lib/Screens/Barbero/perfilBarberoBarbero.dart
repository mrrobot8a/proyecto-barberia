import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Barbero/modificarBarberoBarbero.dart';
//import 'package:flutter_auth/Screens/Admin/PerfilBarberoBarbero.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/modelos/usuario.dart';

import '../../size_config.dart';

class PerfilBarberoBarbero extends StatefulWidget {
  final idBarbero;
  final List perfil;
  PerfilBarberoBarbero({Key key, this.perfil, this.idBarbero});

  @override
  _PerfilBarberoBarberoState createState() => _PerfilBarberoBarberoState();
}

String identificacion = "";
String nombreUsuario = "";
String telefono = "";
String correo = "";
String rutaFoto = "";

class _PerfilBarberoBarberoState extends State<PerfilBarberoBarbero> {
  


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    recorrerLista(widget.perfil);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          leading: SizedBox(),
          centerTitle: true,
          title: Text("Perfil"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ModificarBarberoBarbero(
                              perfil: widget.perfil,
                              idperfil: widget.idBarbero,
                            )));
              },
              child: Text(
                "Editar",
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){

              }
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.defaultSize * 24,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: SizeConfig.defaultSize * 15,
                        color: kPrimaryColor,
                      )),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.defaultSize * 14,
                          width: SizeConfig.defaultSize * 14,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white,
                                  width: SizeConfig.defaultSize * 0.8),
                              image: DecorationImage(
                                image: NetworkImage(
                                  //"https://st3.depositphotos.com/12071432/18627/i/600/depositphotos_186272986-stock-photo-serious-handsome-barber-holding-razor.jpg"
                                    //widget.perfil[0].rutaFoto,
                                    rutaFoto,
                                    ),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(height: 10),
                        Text(identificacion,
                            style: TextStyle(fontSize: SizeConfig.defaultSize * 2.2)),
                        SizedBox(height: SizeConfig.defaultSize / 2),
                        Text(nombreUsuario
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2, vertical: SizeConfig.defaultSize * 3),
              child: Row(
                children: <Widget>[
                  Icon(Icons.alternate_email),
                  SizedBox(
                    width: SizeConfig.defaultSize * 2,
                  ),
                  Text(correo
                  ),
                  Spacer(),
                  Icon(Icons.info)
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2, vertical: SizeConfig.defaultSize * 3),
              child: Row(
                children: <Widget>[
                  Icon(Icons.phone),
                  SizedBox(
                    width: SizeConfig.defaultSize * 2,
                  ),
                  Text(telefono
                  ),
                  Spacer(),
                  Icon(Icons.info)
                ],
              ),
            ),
            
          ],
        ));
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}


void recorrerLista(List<dynamic> list ){
  print(list.toString());

  for (var i = 0; i < list.length; i++) {
    identificacion = list[i]["identificacion"];
    nombreUsuario = list[i]["nombreUsuario"];
    correo = list[i]["correo"];
    telefono = list[i]["telefono"];
    rutaFoto = list[i]["rutaFoto"];
  }


 
  print("2 "+rutaFoto);
}