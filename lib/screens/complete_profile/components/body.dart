import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/complete_profile/components/complete_profile_form.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.02,
            ),
            Text(
              "Profil tamamla",
              style: headingStyle,
            ),
            Text(
              "Profil detaylarınızı girin veya \nsosyal medya hesabınız ile devam edin",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.05,
            ),
            CompleteProfileForm(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Text(
              "Devam ettiğinizde durumda \nşartlar ve koşullarımızı kabul etmiş olursunuz",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
