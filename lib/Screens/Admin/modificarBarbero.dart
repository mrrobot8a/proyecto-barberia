import 'package:flutter_auth/modelos/usuario.dart';
import 'package:flutter_auth/peticiones/usuariohttp.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'mainAdmin.dart';

class ModificarBarbero extends StatefulWidget {
  final idperfil;
  final List<Usuario> perfil;
  ModificarBarbero({Key key, this.perfil, this.idperfil});
  @override
  _ModificarBarberoState createState() => _ModificarBarberoState();
}

class _ModificarBarberoState extends State<ModificarBarbero> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controlidBarbero = TextEditingController();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  TextEditingController controlFoto = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();

  @override
  void initState() {
    controlidBarbero = TextEditingController(
        text: widget.perfil[widget.idperfil].identificacion);
    controlNombre = TextEditingController(
        text: widget.perfil[widget.idperfil].nombreUsuario);
    controlTelefono =
        TextEditingController(text: widget.perfil[widget.idperfil].telefono);
    controlEmail =
        TextEditingController(text: widget.perfil[widget.idperfil].correo);
    controlPass =
        TextEditingController(text: widget.perfil[widget.idperfil].pass);
    controlFoto =
        TextEditingController(text: widget.perfil[widget.idperfil].rutaFoto);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 40),
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
                      editarUsuario(
                        widget.perfil[widget.idperfil].identificacion,
                        controlNombre.text,
                        controlTelefono.text,
                        controlEmail.text,
                        controlPass.text,
                        controlFoto.text,
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MainAdmin(),
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
