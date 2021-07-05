import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/components/category_card.dart';
import 'package:flutter_auth/components/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/modelos/barberosBarbero.dart';
import 'package:flutter_auth/modelos/category.dart';
import 'package:flutter_auth/peticiones/usuariohttp.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:http/http.dart' as http;

class InicioUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  width: double.infinity,
                  height: 280.0,
                  padding: EdgeInsets.only(bottom: 90.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Barbero_login.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.black12.withOpacity(.0),
                        elevation: 0,
                        leading: SizedBox(),
                        actions: <Widget>[
                          IconButton(
                              icon: Icon(Icons.exit_to_app_outlined,color: Colors.red),
                              onPressed: () {
                                
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                              }),
                        ],
                      ),
                      Spacer(),
                      SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ),
              
              CustomListTile(title: "Barberos"),
              SizedBox(height: 25.0),
              
              Container(
                width: double.infinity,
                height: 300.0,
                child: getInfo(context),
              ),
              SizedBox(
                height: 20,
              ),
              CustomListTile(title: "Servicios"),
              SizedBox(height: 25.0),
              Container(
                width: double.infinity,
                height: 150.0,
                child: ListView.builder(
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var category = categoryList[index];
                    return CategoryCard(
                      category: category,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget getInfo(BuildContext context) {
  return FutureBuilder(
    future: listarPost(http
        .Client()), //En esta línea colocamos el el objeto Future que estará esperando una respuesta
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      switch (snapshot.connectionState) {

        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el loader
        case ConnectionState.waiting:
          return Center(child: CircularProgressIndicator());

        case ConnectionState.done:
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          // print(snapshot.data);
          return snapshot.data != null
              ? BarberosBarbero(barbero: snapshot.data)
              : Text(
                  snapshot.data != null
                      ? 'ID: ${snapshot.data['id']}\nTitle: ${snapshot.data['title']}'
                      : 'Vuelve a intentar',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                );

        default:
          return Text('Presiona el boton para recargar');
      }
    },
  );
}