import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_auth/modelos/turno.dart';
import 'package:flutter_auth/modelos/usuario.dart';
import 'package:http/http.dart' as http;

Future<List<Usuario>> listarPost(http.Client client) async {
  final response = await http.get(Uri.parse(
      "https://gestiondeturnosbarberia.000webhostapp.com/listarUsuario.php"));
  return compute(pasaraListas, response.body);
}

List<Usuario> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
  return pasar.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

Future<List<Turno>> listarPosts(http.Client client) async {
  final response = await http.get(Uri.parse(
      "https://gestiondeturnosbarberia.000webhostapp.com/listarturno.php"));
  return compute(pasaraLista, response.body);
}

List<Turno> pasaraLista(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();
  return pasar.map<Turno>((json) => Turno.fromJson(json)).toList();
}

Future<List> login(user, pass) async {
  var url =
      Uri.parse("http://gestiondeturnosbarberia.000webhostapp.com/login.php");

  final response = await http.post(url, body: {
    "correo": user,
    "pass": pass,
  });

  var dataUser = json.decode(response.body);

  return dataUser;
}

void adicionarUsuario(
    String identificacion,
    String nombreUsuario,
    String telefono,
    String correo,
    String pass,
    String rutaFoto,
    String idRol) async {
  var url = Uri.parse(
      "http://gestiondeturnosbarberia.000webhostapp.com/adicionar.php");

  await http.post(url, body: {
    'identificacion': identificacion,
    'nombreUsuario': nombreUsuario,
    'telefono': telefono,
    'correo': correo,
    'pass': pass,
    'rutaFoto': rutaFoto,
    'idRol': idRol
  });
}

void adicionarturno(
  String nombreUsuario,
  String numeroturno,
) async {
  var url = Uri.parse(
      "https://gestiondeturnosbarberia.000webhostapp.com/addturno.php");

  await http.post(url, body: {
    'nombre': nombreUsuario,
    'turno': numeroturno,
  });
}

void editarUsuario(String identificacion, String nombreUsuario, String telefono,
    String correo, String pass, String rutaFoto) async {
  var url = Uri.parse(
      "https://gestiondeturnosbarberia.000webhostapp.com/editarUsuario.php");

  final reponse = await http.post(url, body: {
    'identificacion': identificacion,
    'nombreUsuario': nombreUsuario,
    'telefono': telefono,
    'correo': correo,
    'pass': pass,
    'rutaFoto': rutaFoto,
  });
  print(reponse.body);
}

void editarUsuario2(
  Usuario user,
) async {
  var url = Uri.parse(
      "https://gestiondeturnosbarberia.000webhostapp.com/editarUsuario.php");

  await http.post(url, body: {
    'identificacion': user.identificacion,
    'nombreUsuario': user.nombreUsuario,
    'telefono': user.telefono,
    'correo': user.correo,
    'pass': user.pass,
    'rutaFoto': user.rutaFoto,
  });
}

void eliminarUsuario(identificacion) async {
  var url = Uri.parse(
      "https://gestiondeturnosbarberia.000webhostapp.com/eliminarUsuario.php");

  await http.post(url, body: {
    'identificacion': identificacion,
  });
}
