import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/otp/components/otp_screen.dart';
import 'package:shop_app/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getproportionateScreenWidth(20)),
        child: Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildLastNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPhoneNumberFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildAddressFormField(),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DefaultButton(
              text: "Devam et",
              press: () {
                if (_formKey.currentState.validate()) {
                  // otp ekranına git
                  Navigator.pushNamed(context, OtpScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: kAddressNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            addError(error: kAddressNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Adres",
        hintText: "Adresinizi girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: kPhoneNumberNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            addError(error: kPhoneNumberNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Telefon numarası",
        hintText: "Telefon numaranızı girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: kLastNameNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            addError(error: kLastNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Soyad",
        hintText: "Soyadınızı girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: kFirstNameNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            addError(error: kFirstNameNullError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Ad",
        hintText: "Adınızı girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
