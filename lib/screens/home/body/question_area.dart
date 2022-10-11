import 'package:apart_rent/constants.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

class QuestionArea extends StatelessWidget {
  const QuestionArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Các câu hỏi thường gặp:",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Xem thêm",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              GestureDetector(
                onTap: () {
                  _launchUrl();
                },
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Giới thiệu về Rent-Ap",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              GestureDetector(
                onTap: () {},
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rent-Ap có an toàn không?",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              GestureDetector(
                onTap: () {},
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Các ràng buộc khi cho thuê và bán chung cư?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              GestureDetector(
                onTap: () {},
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Các điều khoản Rent-Ap là gì?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              GestureDetector(
                onTap: () {},
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hướng dẫn đăng tin.",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
