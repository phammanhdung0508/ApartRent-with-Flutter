import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

//import 'package:apart_rent/size_config.dart';
import 'package:apart_rent/screens/about/body/body.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static String routeName = "/about";

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}