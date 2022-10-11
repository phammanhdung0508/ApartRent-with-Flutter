import 'package:apart_rent/components/news_card.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

class WhatNews extends StatelessWidget {
  const WhatNews({Key? key}) : super(key: key);

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
                "Tin gì mới?",
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
              NewsCard(
                  image: "assets/images/new1.jpg",
                  title:
                      "Legacy Central, Khu đô thị phức hợp đẳng cấp quốc tế Bảo Ninh 1",
                  press: () {}),
              NewsCard(
                  image: "assets/images/new2.jpg",
                  title: "Regal Legend Quảng Bình, Phố thương mại châu Âu",
                  press: () {}),
              NewsCard(
                  image: "assets/images/new3.jpg",
                  title:
                      "Richland Residence, do Công ty CP Đầu tư và Phát triển Thuận Lợi làm chủ đầu tư",
                  press: () {}),
              NewsCard(
                  image: "assets/images/new_momo.png",
                  title:
                      "HOT: Rent-Ap x MOMO - LÊN CHỢ TỐT CHỐT ĐƠN, NHẬN 150K",
                  press: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
