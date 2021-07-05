import 'package:flutter_auth/peticiones/usuariohttp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import '../../constants.dart';
import 'mainAdmin.dart';

class AgregarBarbero extends StatefulWidget {
  @override
  _AgregarBarberoState createState() => _AgregarBarberoState();
}

class _AgregarBarberoState extends State<AgregarBarbero> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controlidBarbero = TextEditingController();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  TextEditingController controlFoto = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();
  
  String controlRol = "2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
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
                  controller: controlidBarbero,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    color: Colors.black,
                  ), // // Probar todos los teclados
                  decoration: new InputDecoration(
                      icon: Icon(
                        Icons.badge,
                        color: kPrimaryColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 0.5),
                      ),
                      labelText: 'Cedula',
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
                  onSaved: (String value) => controlidBarbero =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
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
                    if(controlidBarbero.text.isNotEmpty && controlNombre.text.isNotEmpty && controlTelefono.text.isNotEmpty &&
                    controlPass.text.isNotEmpty && controlFoto.text.isNotEmpty){

                      adicionarUsuario(
                        controlidBarbero.text,
                        controlNombre.text,
                        controlTelefono.text,
                        controlEmail.text,
                        controlPass.text,
                        controlFoto.text,
                        controlRol,
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MainAdmin(),
                      ));
                    }else{
                      save();
                    }
                    
                  },
                  child: Text("Registrar",
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
          backgroundImage: AssetImage("assets/barbero2.jpg"),
        ),
        
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: IconButton(
            color: kPrimaryColor,
            icon: const Icon(Icons.camera_alt, size: 28.0), 
            onPressed: () {
             
            },
          ),
        )
      ],
    ));
  }

  save() {
    if (_formKey.currentState.validate()) {
      print("idEmpleado ${controlidBarbero.text}");
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

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountName:
                Text("ADMINISTRADOR", style: TextStyle(color: kPrimaryColor)),
            accountEmail: Text("adminBarber@gmail.com",
                style: TextStyle(color: kPrimaryColor)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/Barbero_login.png"),
              backgroundColor:
                  Theme.of(context).platform == TargetPlatform.android
                      ? kPrimaryLightColor
                      : kPrimaryLightColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: new ListTile(
              leading: new Icon(Icons.home, color: Colors.black),
              title: Text("Inicio"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainAdmin(),
                ));
              },
            ),
          ),
          Ink(
            color: kPrimaryColor,
            child: new ListTile(
              leading: new Icon(Icons.app_registration, color: Colors.white),
              title: Text(
                "Registrar Barberos",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: new ListTile(
              title: Text("Estadisticas"),
              leading: new Icon(Icons.stacked_bar_chart, color: Colors.black),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: new ListTile(
              title: Text(
                "SALIR",
                style: TextStyle(color: Colors.red),
              ),
              leading: new Icon(Icons.exit_to_app_sharp, color: Colors.red),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

