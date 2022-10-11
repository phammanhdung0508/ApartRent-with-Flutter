import 'package:apart_rent/navigator/google_navigator.dart';
import 'package:apart_rent/provider/google_sign_in_service.dart';
import 'package:apart_rent/screens/profile/body/background.dart';
import 'package:apart_rent/screens/profile/body/profileMenu.dart';
import 'package:apart_rent/screens/profile/body/profilePic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () {
                final provider =
                    Provider.of<GoogleSignInService>(context, listen: false);
                provider.logout();
                Navigator.popUntil(
                    context, ModalRoute.withName(GoogleNavigator.routeName));
              },
            ),
          ],
        ),
      ),
    );
  }
}
