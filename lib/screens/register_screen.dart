import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:winnintips/Components/decorated_button.dart';
import 'package:winnintips/Components/decorated_input.dart';
import 'package:winnintips/Components/link_label.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/screens/login_screen.dart';
import 'package:winnintips/services/network_operations.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading;
  String errorMessage;

  var emailController = new TextEditingController();
  var firstNameController = new TextEditingController();
  var lastNameController = new TextEditingController();
  var passwordController = new TextEditingController();
  var passwordConfirmController = new TextEditingController();
  var telephoneController = new TextEditingController();
  var locationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: SvgPicture.asset('assets/images/winnintips-logo.svg')),
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Free account",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: dkGreyColor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DecoratedInputBox(
                            controller: firstNameController,
                            hintText: "Enter your firstname",
                            inputType: TextInputType.text,
                            secureText: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DecoratedInputBox(
                            controller: lastNameController,
                            hintText: "Enter your lastname",
                            inputType: TextInputType.text,
                            secureText: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DecoratedInputBox(
                            controller: emailController,
                            hintText: "Enter your email address",
                            inputType: TextInputType.emailAddress,
                            secureText: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DecoratedInputBox(
                            controller: locationController,
                            hintText: "Enter your Location",
                            inputType: TextInputType.text,
                            secureText: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DecoratedInputBox(
                            controller: telephoneController,
                            hintText: "Telephone Number",
                            inputType: TextInputType.phone,
                            secureText: false,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DecoratedInputBox(
                            controller: passwordController,
                            hintText: "Enter your password",
                            inputType: TextInputType.text,
                            secureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DecoratedInputBox(
                            controller: passwordConfirmController,
                            hintText: "Confirm your password",
                            inputType: TextInputType.text,
                            secureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DecoratedButton(
                            onPressed: () async {

                              var registrationInfo = {
                                "firstName": firstNameController.text,
                                "lastName": lastNameController.text,
                                "telephone": telephoneController.text,
                                "location": locationController.text,
                                "password": passwordController.text
                              };

                              var registrationResponse = await userRegistration(registrationInfo);

                              print(registrationResponse);
                            },
                            text: "Create Account",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LabelLink(
                            primaryText: "Already have an account",
                            linkText: "Login here",
                            onPress: () => {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, LoginScreen.routeName, (route) => false)
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
