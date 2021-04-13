import 'package:flutter/material.dart';
import 'package:winnintips/constants/colors.dart';

class LabelLink extends StatelessWidget {
  const LabelLink({Key key, this.primaryText, this.linkText, this.onPress})
      : super(key: key);

  final String primaryText;
  final String linkText;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          primaryText,
          style: TextStyle(fontSize: 20),
        ),
        TextButton(
          onPressed: onPress,
          child: Text(
            linkText,
            style: TextStyle(
                fontSize: 20, color: brightOrange, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
