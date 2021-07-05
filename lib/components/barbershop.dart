import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/modelos/barbershop.dart';
import 'package:flutter/material.dart';

//aqui es el car de las fotos
class BarbershopCard extends StatelessWidget {
  final Barbershop barbershop;
  BarbershopCard({this.barbershop});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      // color: Colors.red,
      margin: EdgeInsets.only(left: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 230.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              image: DecorationImage(
                image: AssetImage(barbershop.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 150.0,
                child: Text(
                  barbershop.name,
                  overflow: TextOverflow.ellipsis,
                  style: kTitleItem,
                ),
              ),
              Spacer(),
              Icon(
                Icons.star,
                size: 15.0,
                color: kYellow,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
