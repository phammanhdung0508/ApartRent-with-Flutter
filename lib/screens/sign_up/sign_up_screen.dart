import 'package:apart_rent/screens/sign_up/body/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget{
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_up";

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng ký"),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
        body: const Body(),
    );
  }
}