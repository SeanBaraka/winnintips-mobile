import 'package:flutter/material.dart';

class TeamTagWidget extends StatelessWidget {
  const TeamTagWidget({
    Key key,
    this.teamName,
    this.labelText,
    this.isFeatured
  }) : super(key: key);
  final String teamName,labelText;
  final bool isFeatured;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 5,),
        Text(teamName, style: TextStyle(
            fontSize: isFeatured ? 20 : 17
        ),)
      ],
    );
  }
}
