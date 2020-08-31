import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;
  final List<String> errors = [];

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
        child: Column(
      children: [
        buildEmailFormField(),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        buildPasswordFormField(),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        buildConfirmPasswordFormField(),
        FormError(errors: errors),
        SizedBox(
          height: getProportionateScreenHeight(35),
        ),
        DefaultButton(
          text: "Devam et",
          press: () {
            if (_formKey.currentState.validate()) {
              // go to complete profile screen
              Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            }
          },
        ),
      ],
    ));
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          setState(() {
            removeError(error: kMatchPasswordError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: kMatchPasswordError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre doğrulama",
        hintText: "Şifrenizi tekrar girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: kPasswordNullError);
          });
        } else if (value.length >= 6) {
          setState(() {
            removeError(error: kShortPasswordError);
          });
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            addError(error: kPasswordNullError);
          });
          return "";
        } else if (value.length < 6) {
          setState(() {
            addError(error: kShortPasswordError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre",
        hintText: "Şifrenizi girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            removeError(error: kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            removeError(error: kInvalideEmailError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          setState(() {
            addError(error: kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            addError(error: kInvalideEmailError);
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "E-posta",
        hintText: "E-postanızı girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
