import 'package:apart_rent/constants.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  const IconBtnWithCounter(
      {Key? key, required this.svgSrc, this.numOfitem = 0, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          padding: EdgeInsets.all(
            getProportionateScreenWidth(12),
          ),
          height: getProportionateScreenWidth(55),
          width: getProportionateScreenWidth(55),
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(svgSrc),
        ),
        if (numOfitem != 0)
          Positioned(
            top: -5,
            right: -6,
            child: Container(
              height: getProportionateScreenWidth(25),
              width: getProportionateScreenWidth(25),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4848),
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  "$numOfitem",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(10),
                    height: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
