import 'package:apart_rent/screens/about/about_screen.dart';
import 'package:apart_rent/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleNavigator extends StatelessWidget {
  const GoogleNavigator({Key? key}) : super(key: key);
  static String routeName = "/naviga";

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return const HomeScreen();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something Went Wrong!'));
            } else {
              return const AboutScreen();
              // MaterialApp(
              //   theme: theme(),
              //   initialRoute: AboutScreen.routeName,
              //   routes: routes,);
            }
          },
        ),
      );
}
