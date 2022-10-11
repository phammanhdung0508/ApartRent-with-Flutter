import 'package:apart_rent/navigator/google_navigator.dart';
import 'package:apart_rent/screens/about/about_screen.dart';
import 'package:apart_rent/screens/home/home_screen.dart';
import 'package:apart_rent/screens/post_create/post_create_screen.dart';
import 'package:apart_rent/screens/post_detail/hidden_detail_screen.dart';
import 'package:apart_rent/screens/post_detail/post_detail_screen.dart';
import 'package:apart_rent/screens/post_detail/waiting_detail_screen.dart';
import 'package:apart_rent/screens/post_manager/post_manager_screen.dart';
import 'package:apart_rent/screens/profile/profile_screen.dart';
import 'package:apart_rent/screens/sign_in/sign_in_screen.dart';
import 'package:apart_rent/screens/sign_up/sign_up_screen.dart';
import 'package:apart_rent/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  AboutScreen.routeName: (context) => const AboutScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  PostManagerScreen.routeName: (context) => const PostManagerScreen(),
  PostCreateScreen.routeName: (context) => const PostCreateScreen(),
  PostDetailScreen.routeName: (context) => const PostDetailScreen(),
  WaitingDetailScreen.routeName: (context) => const WaitingDetailScreen(),
  HiddenDetailScreen.routeName: (context) => const HiddenDetailScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  GoogleNavigator.routeName: (context) => const GoogleNavigator(),
  NotificationScreen.routeName: (context) => const NotificationScreen()
};
