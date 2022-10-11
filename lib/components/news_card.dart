import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String image, title;
  final GestureTapCallback press;
  const NewsCard(
      {Key? key, required this.image, required this.title, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(20),
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: GestureDetector(
          onTap: press,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AspectRatio(
                aspectRatio: 1.02,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    image,
                  ),
                )
                // Container(
                //   padding: EdgeInsets.all(
                //     getProportionateScreenWidth(5),
                //   ),
                //   decoration: BoxDecoration(
                //     color: kSecondaryColor.withOpacity(0.1),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: Image.asset(
                //     image,
                //     fit: BoxFit.cover,
                //   ),
                ),
            const SizedBox(
              height: 3,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 10),
              maxLines: 2,
            ),
          ]),
        ),
      ),
    );
  }
}
