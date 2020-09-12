import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    this.width = 140,
    this.aspectRatio = 1.02,
    @required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getproportionateScreenWidth(20)),
      child: SizedBox(
        width: getproportionateScreenWidth(width),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: EdgeInsets.all(getproportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: kSecondartColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              product.title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${product.price} TL",
                  style: TextStyle(
                    fontSize: getproportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(getproportionateScreenWidth(8)),
                    width: getproportionateScreenWidth(28),
                    height: getproportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      color: product.isFavourite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondartColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: product.isFavourite
                          ? Color(0xFFFF4848)
                          : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
