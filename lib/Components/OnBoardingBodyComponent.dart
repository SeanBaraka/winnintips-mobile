import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnintips/Components/PagerItem.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/screens/login_screen.dart';
import 'package:winnintips/screens/splash_screen.dart';

class OnBoardingBodyComponent extends StatefulWidget {
  @override
  _OnBoardingBodyComponentState createState() =>
      _OnBoardingBodyComponentState();
}

class _OnBoardingBodyComponentState extends State<OnBoardingBodyComponent> {
  int currentPage = 0;

  List<Map<String, String>> pagerItems = [
    {
      "text":
          "Predictions from a dozen + leagues and competitions from around the globe",
      "image": "assets/images/sports.svg"
    },
    {
      "text":
          "Be the first to know with our live score updates, making sure  you never miss an highlight",
      "image": "assets/images/first-place.svg"
    },
    {
      "text":
          "Correct and well analysed predictions from professional analysts and pundits",
      "image": "assets/images/medal.svg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          SvgPicture.asset('assets/images/winnintips-logo.svg'),
          Expanded(
              flex: 3,
              child: Container(
                  child: PageView.builder(
                onPageChanged: (value) => {
                  setState(() => {currentPage = value})
                },
                physics: BouncingScrollPhysics(),
                itemCount: pagerItems.length,
                itemBuilder: (context, index) => PagerItem(
                  text: pagerItems[index]['text'],
                  image: pagerItems[index]['image'],
                ),
              ))),
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pagerItems.length,
                      (index) => buildIndicatorDot(index: index)),
                ),
              )),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString('onBoarded', 'true');

                      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
                      },
                style: ElevatedButton.styleFrom(
                    primary: prColor,
                    onPrimary: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
                child: Text(
                  "Today's Predictions",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }

  AnimatedContainer buildIndicatorDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 8,
      width: currentPage == index ? 20 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentPage == index ? prColor : lightGreyColor,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
