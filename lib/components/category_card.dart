import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/modelos/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  CategoryCard({this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundColor: category.color,
            child: SvgPicture.asset(
              category.icon,
              color: Colors.white,
              width: 30.0,
            ),
          ),
          Text(category.title, style: kTitleItem),
          Text(
            "${category.precio} Pesos",
            style: kSubtitleItem,
          ),
        ],
      ),
    );
  }
}
