import 'package:flutter/material.dart';

class Product {
  final int id;
  final String productname;
  final double price;
  final Image image;

  Product(
      {required this.id,
      required this.productname,
      required this.price,
      required this.image});
}
