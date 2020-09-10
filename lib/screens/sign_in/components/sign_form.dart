import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
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
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Hatırla"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Şifremi unuttum",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
            text: "Devam et",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if everything is OK then go to login success screen
                if (errors.isEmpty) {
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              }
            },
          )
        ],
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
        }
        if (emailValidatorRegExp.hasMatch(value)) {
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
