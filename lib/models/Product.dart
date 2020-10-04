import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final int id;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.images,
    @required this.colors,
    this.rating = 0.0,
    @required this.price,
    this.isFavourite = false,
    this.isPopular = false,
  });
}

List<Product> demoProducts = [
  Product(
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4",
    price: 250.00,
    description: "description test test",
    rating: 4.5,
    isFavourite: true,
    isPopular: true,
    id: 0,
  ),
  Product(
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike pantolon",
    price: 119.75,
    description: "description",
    rating: 4.1,
    isFavourite: false,
    isPopular: false,
    id: 1,
  ),
  Product(
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Eldiven",
    price: 32.49,
    description:
        "description Eldiven description Eldiven description Eldiven description description description",
    rating: 3.7,
    isFavourite: true,
    isPopular: true,
    id: 2,
  ),
  Product(
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless headset",
    price: 134.99,
    description:
        "description Wireless headsetWireless headsetWireless headsetWireless headsetWireless headset",
    rating: 3.9,
    isFavourite: true,
    isPopular: true,
    id: 3,
  ),
];
