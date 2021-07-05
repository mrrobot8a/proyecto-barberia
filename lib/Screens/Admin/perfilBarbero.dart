import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/mainAdmin.dart';
import 'package:flutter_auth/Screens/Admin/modificarBarbero.dart';
//import 'package:flutter_auth/Screens/Admin/PerfilBarbero.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/modelos/usuario.dart';
import 'package:flutter_auth/peticiones/usuariohttp.dart';

import '../../size_config.dart';

class PerfilBarbero extends StatefulWidget {
  final idBarbero;
  final List<Usuario> perfil;

  PerfilBarbero({Key key, this.perfil, this.idBarbero});

  @override
  _PerfilBarberoState createState() => _PerfilBarberoState();
}

class _PerfilBarberoState extends State<PerfilBarbero> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text("Perfil"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ModificarBarbero(
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
              onPressed: () {
                confirmaeliminar(
                    context, widget.perfil[widget.idBarbero].identificacion);
              }),
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
                                    widget.perfil[widget.idBarbero].rutaFoto),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(height: 10),
                        Text(widget.perfil[widget.idBarbero].identificacion,
                            style: TextStyle(
                                fontSize: SizeConfig.defaultSize * 2.2)),
                        SizedBox(height: SizeConfig.defaultSize / 2),
                        Text(widget.perfil[widget.idBarbero].nombreUsuario),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2,
                  vertical: SizeConfig.defaultSize * 3),
              child: Row(
                children: <Widget>[
                  Icon(Icons.alternate_email),
                  SizedBox(
                    width: SizeConfig.defaultSize * 2,
                  ),
                  Text(widget.perfil[widget.idBarbero].correo),
                  Spacer(),
                  Icon(Icons.info)
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize * 2,
                  vertical: SizeConfig.defaultSize * 3),
              child: Row(
                children: <Widget>[
                  Icon(Icons.phone),
                  SizedBox(
                    width: SizeConfig.defaultSize * 2,
                  ),
                  Text(widget.perfil[widget.idBarbero].telefono),
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

void confirmaeliminar(context, ideliminar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('Realmente Desea Eliminar?'),
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Icon(Icons.check_circle),
            onPressed: () {
              eliminarUsuario(ideliminar);
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  settings: const RouteSettings(name: '/PrincipalAdmin'),
                  builder: (context) => new MainAdmin()));
            },
          ),
        ],
      );
    },
  );
}
