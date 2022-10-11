import 'package:apart_rent/components/item_card.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

class WorkArea extends StatelessWidget {
  const WorkArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Các dự án bạn có thể quan tâm?",
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
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ItemCard(
                  category: "Dự án khu đô thị Đông Tăng Long",
                  image: "assets/images/apart1.jpg",
                  numOfBrands: 1,
                  press: () {}),
              ItemCard(
                category: "Dự án khu đô thị Sala",
                image: "assets/images/apart2.jpg",
                numOfBrands: 2,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
