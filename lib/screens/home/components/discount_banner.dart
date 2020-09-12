import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getproportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getproportionateScreenWidth(20),
        vertical: getproportionateScreenWidth(15),
      ),
      width: double.infinity,
      //height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(TextSpan(
        text: "Yaz Kampanyası\n",
        style: TextStyle(color: Colors.white),
        children: [
          TextSpan(
            text: "%20 indirim",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
