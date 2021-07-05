

import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/body.dart';
import 'package:flutter_auth/constants.dart';

import '../../size_config.dart';

class PerfilBarberia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.0,
        leading: SizedBox(),
        centerTitle: true,
        title: Text("Perfil"),
        actions: <Widget>[
          FlatButton(onPressed: (){},
          child: Text("Editar",style: TextStyle(color: Colors.white),),)],
      ),
      body: Body(),
    );
  }
}
