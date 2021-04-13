import 'package:flutter/cupertino.dart';
import 'package:winnintips/screens/about_screen.dart';
import 'package:winnintips/screens/archives_screen.dart';
import 'package:winnintips/screens/home_screen.dart';
import 'package:winnintips/screens/login_screen.dart';
import 'package:winnintips/screens/onboarding_screen.dart';
import 'package:winnintips/screens/profile_screen.dart';
import 'package:winnintips/screens/register_screen.dart';
import 'package:winnintips/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ArchivesScreen.routeName: (context) => ArchivesScreen(),
  AboutScreen.routeName: (context) => AboutScreen()
};
