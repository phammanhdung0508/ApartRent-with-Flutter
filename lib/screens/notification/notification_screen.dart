// ignore_for_file: unnecessary_const

import 'package:apart_rent/bottom_menu.dart';
import 'package:apart_rent/components/custom_bottom_nav_bar.dart';
import 'package:apart_rent/screens/notification/body/body.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static String routeName = "/notification";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Body(),
      bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.notification),
    );
  }
}
