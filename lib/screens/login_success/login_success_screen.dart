import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Giriş başarılı"),
      ),
      body: Body(),
    );
  }
}
