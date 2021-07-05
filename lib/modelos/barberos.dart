import 'package:flutter/cupertino.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/modelos/usuario.dart';
import 'package:flutter_auth/Screens/Admin/perfilBarbero.dart';

class Barberos extends StatelessWidget {
  final List<Usuario> barbero;

  const Barberos({Key key, this.barbero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: barbero == null ? 0 : barbero.length,
      itemBuilder: (context, posicion) {
        return Container(
          width: 200.0,
          margin: EdgeInsets.only(left: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PerfilBarbero(
                              perfil: barbero, idBarbero: posicion)));
                },
                splashColor: Colors.brown.withOpacity(0.5),
                child: Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          barbero[posicion].rutaFoto,
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 200.0,
                    height: 50,
                    child: Text(
                      barbero[posicion].nombreUsuario,            
                      overflow: TextOverflow.ellipsis,
                      style: kTitleItem,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
