import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/peticiones/usuariohttp.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

import '../../constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controlidUsuario = TextEditingController();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPass = TextEditingController();
  //TextEditingController controlFoto = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();
  bool _obscureText = true;

  String controlFoto = "https://recursospracticos.com/wp-content/uploads/2017/10/Sin-foto-de-perfil-en-Facebook.jpg";
  String controlRol = "3";
  var key = "null";
  String encrypt;
  var password = "null";

  PlatformStringCryptor cryptor;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
              Image.asset(
                "assets/images/Barbero_login.png",
                height: size.height * 0.35,
                width: size.width * 2.9,
              ),
              TextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controlEmail,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      color: kPrimaryColor,
                    ),
                    hintText: "Tu correo",
                    border: InputBorder.none,
                  ),
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
              TextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controlidUsuario,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.badge,
                      color: kPrimaryColor,
                    ),
                    hintText: "Tu Identificacion",
                    border: InputBorder.none,
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'El campo no debe estar vacío';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) => controlidUsuario =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: controlNombre,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.account_circle,
                      color: kPrimaryColor,
                    ),
                    hintText: "Tu Nombre",
                    border: InputBorder.none,
                  ),
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
              TextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controlTelefono,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: kPrimaryColor,
                    ),
                    hintText: "Tu Telefono",
                    border: InputBorder.none,
                  ),
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
              TextFieldContainer(
                child: TextFormField(
                  controller: controlPass,
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
                  onSaved: (String value) => controlPass =
                      value.replaceAll(' ', '') as TextEditingController,
                ),
              ),
              
              RoundedButton(
                text: "Registrarse",
                press: () {
                  if(controlidUsuario.text.isNotEmpty && controlNombre.text.isNotEmpty && controlTelefono.text.isNotEmpty &&
                    controlPass.text.isNotEmpty){
                      Encrypt();
                      adicionarUsuario(
                        controlidUsuario.text,
                        controlNombre.text,
                        controlTelefono.text,
                        controlEmail.text,
                        controlPass.text,
                        controlFoto,
                        controlRol,
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                    }else{
                      save();
                    }
                },
              ),
              SizedBox(height: size.height * 0.01),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
  save() {
    if (_formKey.currentState.validate()) {
      print("idEmpleado ${controlidUsuario.text}");
      print("Nombre ${controlNombre.text}");
      print("Telefono ${controlTelefono.text}");
      print("Email ${controlEmail.text}");
      print("Pass ${controlPass.text}");
    
      _formKey.currentState.reset();
      return 1;
    }
  }

  void Encrypt() async{

    cryptor = PlatformStringCryptor();
    final salt = await cryptor.generateSalt();

    password = controlPass.text;

    key = await cryptor.generateKeyFromPassword(password, salt);

    encrypt = await cryptor.encrypt(password, key);

    print(encrypt);

  }


}
