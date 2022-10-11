import 'package:apart_rent/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HiUser extends StatelessWidget {
  const HiUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
      children: <Widget>[
        CircleAvatar(
                  backgroundImage:
                      NetworkImage(user.photoURL!),
        ),
        const SizedBox(width: 10),
        Text(
          'Hi ${user.displayName!}',
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
      ),
    );
  }
}
