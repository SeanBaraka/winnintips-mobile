import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/routes.dart';
import 'package:winnintips/screens/home_screen.dart';
import 'package:winnintips/screens/login_screen.dart';
import 'package:winnintips/screens/onboarding_screen.dart';
import 'package:winnintips/screens/splash_screen.dart';

void main() {
  InAppPurchaseConnection.enablePendingPurchases();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool onBoarded = false;
  bool userIsLoggedIn = false;

  @override
  void initState(){
    // TODO: implement initState
    checkIfLoggedIn();
    checkIfOnBoard();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Winnintips Predicts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        fontFamily: 'Spartan',
      ),
      // home: OnBoardingScreen(),
      initialRoute: userIsLoggedIn == true ? HomeScreen.routeName : onBoarded == true ? LoginScreen.routeName : OnBoardingScreen.routeName,
      routes: routes,
    );
  }

  void checkIfOnBoard() async{
    var prefs = await SharedPreferences.getInstance();
    var isOnBoard = prefs.getString('onBoarded');

    if (isOnBoard != null) {
      onBoarded = true;
    }
  }

  void checkIfLoggedIn() async{
    var prefs = await SharedPreferences.getInstance();
    var isLoggedIn = prefs.getString('winnintipsToken');

    if (isLoggedIn != null) {
      setState(() {
        userIsLoggedIn = true;
      });
    }

  }
}
