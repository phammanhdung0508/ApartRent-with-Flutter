import 'package:apart_rent/bottom_menu.dart';
import 'package:apart_rent/components/custom_bottom_nav_bar.dart';
import 'package:apart_rent/screens/post_manager/body/body.dart';
import 'package:flutter/material.dart';

class PostManagerScreen extends StatelessWidget{
  static String routeName = "/post";
  const PostManagerScreen({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}