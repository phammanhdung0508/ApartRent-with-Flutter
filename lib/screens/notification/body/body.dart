// ignore_for_file: prefer_const_constructors

import 'package:apart_rent/models/notification.dart';
import 'package:apart_rent/repository/api/api.dart';
import 'package:apart_rent/screens/notification/body/appBar.dart';
import 'package:apart_rent/screens/notification/body/background.dart';
import 'package:apart_rent/screens/notification/body/notification_title.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<Notificationn>>? futureListNotification;

  @override
  void initState() {
    super.initState();
    futureListNotification = fetchAllNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F7FB),
        appBar: appBar(
          automaticallyImplyLeading: false,
        ),
        body: Background(
          child: FutureBuilder<List<Notificationn>>(
              future: futureListNotification,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: 10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return notificationTitle(
                            title: snapshot.data![index].title,
                            subtitle: snapshot.data![index].description,
                            trailing: snapshot.data![index].time,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 1,
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.green),
                    );
                  }
                }
                return const CircularProgressIndicator();
              })),
        ));
  }
}
