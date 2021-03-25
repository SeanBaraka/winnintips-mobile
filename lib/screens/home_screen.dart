import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winnintips/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 1,
                child: Container(
                  color: prColor,
                ),
              ),
              Expanded(flex: 5,)
            ],
          ),
        ),
      ),
    );
  }
}
