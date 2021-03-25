import 'package:flutter/material.dart';
import 'package:winnintips/Components/OnBoardingBodyComponent.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = '/onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingBodyComponent(),
    );
  }
}
