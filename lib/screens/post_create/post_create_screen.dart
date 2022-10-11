import 'package:apart_rent/screens/post_create/body/body.dart';
import 'package:flutter/material.dart';

class PostCreateScreen extends StatelessWidget{
  static String routeName = "/create";
  const PostCreateScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return const Scaffold(
      body: Body(),
    );
  }
}