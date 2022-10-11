import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCard extends StatelessWidget{
  final String? icon;
  final Function? press;

  const SocialCard({
    Key? key, 
    this.icon, 
    this.press
    }) : super(key: key);


  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),),
        padding: EdgeInsets.all(getProportionateScreenWidth(12),),
        height: getProportionateScreenHeight(60),
        width: getProportionateScreenWidth(60),
        decoration: const BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,),
        child: SvgPicture.asset(icon!),
          ),
    );
  }
}