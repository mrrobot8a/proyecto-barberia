import 'package:flutter_auth/constants.dart';
import 'package:flutter/material.dart';

class Category {
  final String icon;
  final String title;
  final String precio;
  final Color color;
  Category({this.icon, this.precio, this.title, this.color});
}

List<Category> categoryList = [
  Category(
    icon: "assets/saloon.svg",
    title: "   Corte  \n   Urbano",
    precio: "7000",
    color: kBlack,
  ),
  Category(
    icon: "assets/haircut.svg",
    title: "Barba",
    precio: "3000",
    color: kYellow,
  ),
  Category(
    icon: "assets/palor.svg",
    title: "Extra",
    precio: "1000",
    color: kGreen,
  ),
  Category(
    icon: "assets/shampoo.svg",
    title: "Tinte",
    precio: "5000",
    color: kPink,
  ),
];
