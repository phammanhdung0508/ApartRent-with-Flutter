import 'package:flutter/material.dart';

class CustomDetailPostText extends StatelessWidget {
  final String titleSection;
  final int titleSize;
  final Color titleColor;

  final String contentSection;
  final int contentSize;
  final Color contentColor;

  final int maxline;
  const CustomDetailPostText({
    Key? key,
    required this.titleSection,
    required this.titleSize,
    required this.titleColor,
    required this.contentSection,
    required this.contentSize,
    required this.contentColor,
    required this.maxline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: maxline,
        text: TextSpan(
          text: titleSection,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: titleSize.toDouble(),
              color: titleColor),
          children: <InlineSpan>[
            const WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: SizedBox(width: 10)),
            TextSpan(
              text: contentSection,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: contentSize.toDouble(),
                  color: contentColor),
            ),
          ],
        ),
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //     Container(
    //       alignment: Alignment.centerLeft,
    //       child: Text(
    //         titleSection,
    //         maxLines: maxline,
    //         style: TextStyle(
    //           fontWeight: FontWeight.normal,
    //           fontSize: titleSize.toDouble(),
    //           color: titleColor,
    //         ),
    //       ),
    //     ),
    //     const SizedBox(width: 100),
    //     Container(
    //       alignment: Alignment.centerLeft,
    //       child: Text(
    //         contentSection,
    //         overflow: TextOverflow.ellipsis,
    //         maxLines: maxline,
    //         style: TextStyle(
    //           fontWeight: FontWeight.normal,
    //           fontSize: contentSize.toDouble(),
    //           color: contentColor,
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
