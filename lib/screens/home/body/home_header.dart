import 'package:apart_rent/screens/home/body/icon_btn_with_counter.dart';
import 'package:apart_rent/screens/home/body/search_field.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Chat bubble Icon.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
