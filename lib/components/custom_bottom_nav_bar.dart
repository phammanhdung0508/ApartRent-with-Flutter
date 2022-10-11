import 'package:apart_rent/bottom_menu.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/screens/home/home_screen.dart';
import 'package:apart_rent/screens/notification/notification_screen.dart';
import 'package:apart_rent/screens/post_manager/post_manager_screen.dart';
import 'package:apart_rent/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({Key? key, required this.selectedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.5),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, PostManagerScreen.routeName);
                },
                icon: Icon(
                  Icons.manage_search,
                  size: 32,
                  color: MenuState.favourite == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                )),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationScreen.routeName);
              },
              icon: Icon(
                Icons.notifications,
                size: 30,
                color: MenuState.notification == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              // SvgPicture.asset(
              //   "assets/icons/Bell.svg",
              //   color: MenuState.notification == selectedMenu
              //       ? kPrimaryColor
              //       : inActiveIconColor,
              //   ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              icon: Icon(
                Icons.settings,
                size: 30,
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
