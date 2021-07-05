import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/mainAdmin.dart';
import 'package:flutter_auth/Screens/Barbero/mainBarbero.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/Usuario/mainUsuario.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/peticiones/usuariohttp.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<bool> alertError({String title, String message}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$title'),
            content: Text('$message'),
            actions: <Widget>[
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Iniciar Sesion",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/Barbero_login.png",
                height: size.height * 0.45,
                width: size.width * 2.9,
              ),
              SizedBox(height: size.height * 0.03),
              TextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      color: kPrimaryColor,
                    ),
                    hintText: "Correo",
                    border: InputBorder.none,
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => txtEmail =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  controller: txtPass,
                  obscureText: _obscureText,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      color: kPrimaryColor,
                      onPressed: _toggle,
                    ),
                    border: InputBorder.none,
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => txtPass =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              RoundedButton(
                text: "Iniciar sesion",
                press: () {
                  login(txtEmail.text, txtPass.text).then((resp) {
                    if (resp.length == 0 ||
                        txtPass.text == '' ||
                        txtEmail.text == '') {
                      alertError(
                          title: 'Error',
                          message: "Compruebe sus credenciales");
                    } else if (resp[0]["correo"] == txtEmail.text &&
                        resp[0]["pass"] == txtPass.text &&
                        resp[0]["idRol"] == "1") {
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              settings: const RouteSettings(
                                  name: '/Vista Administrador'),
                              builder: (context) => new MainAdmin()));
                    } else if (resp[0]['correo'] == txtEmail.text &&
                        resp[0]['pass'] == txtPass.text &&
                        resp[0]['idRol'] == '2') {
                      print(resp[0]['identificacion']);
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              settings:
                                  const RouteSettings(name: '/Vista Barbero'),
                              builder: (context) => new MainBarbero(
                                    user: resp[0]['identificacion'].toString(),
                                  )));
                    } else if (resp[0]["correo"] == txtEmail.text &&
                        resp[0]["pass"] == txtPass.text &&
                        resp[0]["idRol"] == "3") {
                      print(resp[0]['identificacion']);
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              settings:
                                  const RouteSettings(name: '/Vista Usuario'),
                              builder: (context) => new MainUsuario(
                                    user: resp[0]['identificacion'].toString(),
                                  )));
                    } else {
                      alertError(
                          title: 'Error',
                          message: "Compruebe sus credenciales");
                    }
                  });
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void Encrypt() async{

  }





}
