import 'package:apart_rent/components/default_button.dart';
import 'package:apart_rent/screens/about/body/about_content.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/screens/sign_in/sign_in_screen.dart';
import 'package:apart_rent/size_config.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Chào mừng bạn đến với Apart-Re, \nỨng dụng giúp bạn trở thành một nhà quản lý hiệu quả!",
      "image": "assets/images/sale.png"
    },
    {
      "text": "Tất cả dữ liệu căn hộ được lưu trữ và quản lý \ntrên một hệ thống duy nhất trên khắp Việt Nam.",
      "image": "assets/images/task.png"
    },
    {
      "text": "Tự động hóa các quy trình và tối ưu hóa thời gian của bạn. \nLàm việc mọi nơi, hiệu quả như nhau.",
      "image": "assets/images/research.png"
    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => AboutContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: "Tiếp tục",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}