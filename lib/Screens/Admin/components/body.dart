import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Column(
      children: <Widget>[
        Info(
          image: "assets/Barber.jpg",
          name: "Barber Shop",
          email: "adminBarber@gmail.com",
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.directions),
              SizedBox(width: defaultSize *2,),
              Text("Manzana X Casa 4 OGB"),
              Spacer(),
              Icon(Icons.info)
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.phone),
              SizedBox(width: defaultSize *2,),
              Text("3014325622"),
              Spacer(),
              Icon(Icons.info)
            ],
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.schedule),
              SizedBox(width: defaultSize *2,),
              Text("8:00 am a 11:30 am -- 2:00 pm a 10:30 pm"),
              Spacer(),
              Icon(Icons.info)
            ],
          ),
        ),
      ],
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    Key key, this.name, this.email, this.image,
  }) : super(key: key);

  final String name,email,image;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SizedBox(
      height: defaultSize * 24,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: defaultSize * 15,
              color: kPrimaryColor,
            )
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: defaultSize * 14,
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: defaultSize *0.8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage(image)
                      )
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(fontSize:defaultSize *2.2 )
                ),
                SizedBox(height: defaultSize / 2),
                Text(email)
              ],
            ),
          )
        ],
      ),
    );
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
