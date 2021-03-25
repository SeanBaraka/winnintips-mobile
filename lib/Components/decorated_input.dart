import 'package:flutter/material.dart';
import 'package:winnintips/constants/colors.dart';

class DecoratedInputBox extends StatelessWidget {
  const DecoratedInputBox(
      {Key key, this.hintText, this.inputType, this.secureText, this.controller})
      : super(key: key);

  final String hintText;
  final bool secureText;
  final TextInputType inputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: strokeColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 20),
          obscureText: secureText,
          keyboardType: inputType,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: hintText),
        ),
      ),
    );
  }
}
