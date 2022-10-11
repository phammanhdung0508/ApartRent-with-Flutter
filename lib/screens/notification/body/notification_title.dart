// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_interpolation_to_compose_strings

import 'package:apart_rent/screens/notification/body/notificationPage.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class notificationTitle extends StatelessWidget {
  final String title, subtitle, trailing;
  const notificationTitle({
    Key? key,
    required this.title,
    required this.subtitle, 
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        top: 0,
        right: 15,
        bottom: 0,
      ),
      child: SizedBox(
        height: 90,
        child: 
        Card(child: 
        ListTile(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: SvgPicture.asset(
              "assets/icons/Bell.svg",
              height: getProportionateScreenWidth(8),
              width: getProportionateScreenWidth(8),
            ),
          ),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
          isThreeLine: true,
          subtitle: Text(subtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,),
          trailing: Text(trailing),
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NotificationPage())),
          enabled: true,
          tileColor: Colors.white,
        ),
        ),
      ),
    );
  }
}
