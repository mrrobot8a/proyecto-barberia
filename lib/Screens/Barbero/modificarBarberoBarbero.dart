import 'package:flutter_auth/Screens/Admin/mainAdmin.dart';
import 'package:flutter_auth/Screens/Barbero/inicioBarbero.dart';
import 'package:flutter_auth/Screens/Barbero/mainBarbero.dart';
import 'package:flutter_auth/modelos/usuario.dart';
import 'package:flutter_auth/peticiones/usuariohttp.dart';

import 'package:flutter/material.dart';
import '../../constants.dart';

class ModificarBarberoBarbero extends StatefulWidget {
  final idperfil;
  final List perfil;
  ModificarBarberoBarbero({Key key, this.perfil, this.idperfil});
  @override
  _ModificarBarberoBarberoState createState() =>
      _ModificarBarberoBarberoState();
}

String id = "";
String nombreUsuario = "";
String telefono = "";
String correo = "";
String rutaFoto = "";
String pass = "";

class _ModificarBarberoBarberoState extends State<ModificarBarberoBarbero> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controlidBarbero;
  TextEditingController controlNombre;
  TextEditingController controlEmail ;
  TextEditingController controlPass;
  TextEditingController controlFoto ;
  TextEditingController controlTelefono;

  @override
  void initState() {
    recorrerLista(widget.perfil);
    controlidBarbero = TextEditingController(
        text: id);
    controlNombre = TextEditingController(
        text: nombreUsuario);
    controlTelefono =
        TextEditingController(text:telefono);
    controlEmail =
        TextEditingController(text:correo);
    controlPass =
        TextEditingController(text:pass);
    controlFoto =
        TextEditingController(text:rutaFoto);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //recorrerLista(widget.perfil);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12.withOpacity(.0),
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: kPrimaryColor,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            children: <Widget>[
              SizedBox(height: 
              20),
              _buildCircleAvatar(context),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  controller: controlNombre,
                  style: TextStyle(
                    color: Colors.black,
                  ), // // Probar todos los teclados
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.person_pin,
                        color: kPrimaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      labelText: 'Nombre',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => controlNombre =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  controller: controlEmail,
                  style: TextStyle(
                    color: Colors.black,
                  ), // // Probar todos los teclados
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.alternate_email,
                        color: kPrimaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => controlEmail =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  controller: controlPass,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                  ), // // Probar todos los teclados
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => controlPass =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  controller: controlTelefono,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black,
                  ), // // Probar todos los teclados
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.phone,
                        color: kPrimaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      labelText: 'Telefono',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => controlTelefono =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  controller: controlFoto,
                  style: TextStyle(
                    color: Colors.black,
                  ), // // Probar todos los teclados
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.photo_camera_back,
                        color: kPrimaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      labelText: 'Link Foto',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      )),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => controlTelefono =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              SizedBox(height: 20),
              FlatButton(
                  onPressed: () {
                    if (controlNombre.text.isNotEmpty &&
                        controlTelefono.text.isNotEmpty &&
                        controlPass.text.isNotEmpty &&
                        controlFoto.text.isNotEmpty) {
                          print(controlidBarbero.text);
                          //print(widget.perfil[widget.idperfil].identificacion);
                          //print(widget.perfil[widget.perfil.length]);
                          print(controlNombre.text);
                          print(controlTelefono.text);
                          print(controlEmail.text);
                          print(controlPass.text);
                          print(controlFoto.text);
                          print("UUUUUUUUUUUU");
                          Usuario user = new Usuario();
                          user.identificacion = controlidBarbero.text;
                          user.nombreUsuario = controlNombre.text;
                          user.telefono = controlTelefono.text;
                          user.correo = controlEmail.text;
                          user.rutaFoto = controlFoto.text;

                          print(user.identificacion);
                          print(user.nombreUsuario);
                          print(user.telefono);
                          print(user.correo);
                          print(user.rutaFoto);
                        
                      editarUsuario2(
                        user,
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InicioBarbero(),
                      ));
                    } else {
                      save();
                    }
                  },
                  child: Text("Modificar",
                      style: TextStyle(fontSize: 18, color: kPrimaryColor))),
            ],
          ),
        ));
  }

  Widget _buildCircleAvatar(BuildContext context) {
    return Center(
        child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: NetworkImage(controlFoto.text),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: IconButton(
            color: kPrimaryColor,
            icon: const Icon(Icons.camera_alt, size: 28.0),
            onPressed: () {},
          ),
        )
      ],
    ));
  }

  save() {
    if (_formKey.currentState.validate()) {
      print("Nombre ${controlNombre.text}");
      print("Telefono ${controlTelefono.text}");
      print("Email ${controlEmail.text}");
      print("Pass ${controlPass.text}");
      print("Foto ${controlFoto.text}");

      _formKey.currentState.reset();
      return 1;
    }
  }
}

void recorrerLista(List<dynamic> list) {
  print(list.toString());

  for (var i = 0; i < list.length; i++) {
    id = list[i]["identificacion"];
    nombreUsuario = list[i]["nombreUsuario"];
    correo = list[i]["correo"];
    telefono = list[i]["telefono"];
    rutaFoto = list[i]["rutaFoto"];
    pass = list[i]["pass"];
  }

  print("2 " + rutaFoto);
}
