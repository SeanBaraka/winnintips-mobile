import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnintips/Components/decorated_button.dart';
import 'package:winnintips/Components/decorated_input.dart';
import 'package:winnintips/Components/link_label.dart';
import 'package:winnintips/Components/loading_component.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/screens/home_screen.dart';
import 'package:winnintips/screens/register_screen.dart';
import 'package:winnintips/services/network_operations.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

  bool isLoading;
  @override
  void initState() {
    // TODO: implement initState
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: SvgPicture.asset('assets/images/winnintips-logo.svg')),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Login",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: dkGreyColor),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DecoratedInputBox(
                                controller: emailController,
                                hintText: "Enter your email address",
                                inputType: TextInputType.emailAddress,
                                secureText: false,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              DecoratedInputBox(
                                controller: passwordController,
                                hintText: "Enter your password",
                                inputType: TextInputType.text,
                                secureText: true,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              DecoratedButton(
                                text: "Sign In",
                                primaryColor: prColor,
                                textColor: bgColor,
                                onPressed: () async{
                                  setState(() {
                                    isLoading = true;
                                  });

                                  var loginInfo = {
                                    "email": emailController.text,
                                    "password": passwordController.text
                                  };

                                  var loginResponse = await userLogin(loginInfo);

                                  // if a token is present on the returned response
                                  if (loginResponse['token'] != null) {
                                    // store it in shared prefs, for later usage..
                                    var prefs = await SharedPreferences.getInstance();
                                    prefs.setString('winnintipsToken', loginResponse['token']);

                                    // then stop loading...
                                    setState(() {
                                      isLoading = false;
                                    });

                                    // then navigate to the home screen, with tips and shit.
                                    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);

                                  }

                                  // if by any chance we have a message in the response. This means something went wrong somewhere.
                                  // either in the network connection, or incorrect login details.
                                  if (loginResponse['message'] != null) {
                                    var errorMessage = loginResponse['message'];
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }

                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () => {},
                                style:
                                TextButton.styleFrom(padding: EdgeInsets.all(0)),
                                child: Text(
                                  "Forgot Password ?",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 20, color: brightOrange),
                                ),
                              ),
                              LabelLink(
                                primaryText: "Do not have an account",
                                linkText: "Register here",
                                onPress: () => {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.routeName)
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          isLoading ? LoadingComponent() : Container()
        ]
      ),
    );
  }
}
