import 'package:flutter/material.dart';
import 'package:winnintips/constants/colors.dart';

class DecoratedButton extends StatelessWidget {
  const DecoratedButton({Key key, this.text, this.onPressed}) : super(key: key);
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      style: ElevatedButton.styleFrom(primary: brightOrange, onPrimary: bgColor),
    );
  }
}
