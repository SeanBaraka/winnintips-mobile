import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PagerItem extends StatelessWidget {
  const PagerItem({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SvgPicture.asset(
          image,
          width: 140,
        ),
        Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
          ),
        )
      ],
    );
  }
}
