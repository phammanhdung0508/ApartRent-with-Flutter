import 'package:apart_rent/bottom_menu.dart';
import 'package:apart_rent/components/custom_bottom_nav_bar.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/screens/profile/body/body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  //static final user = FirebaseAuth.instance.currentUser!;
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: kPrimaryColor, fontSize: 25),
        ),
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
