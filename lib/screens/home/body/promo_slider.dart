import 'package:apart_rent/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.9,
        aspectRatio: 16 / 9,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imgList.map(
        (url) {
          return Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(2.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}
