
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/screens/about_screen.dart';
import 'package:winnintips/screens/profile_screen.dart';

class TopViewWidget extends StatelessWidget {
  const TopViewWidget({
    Key key,
    this.heading,
    this.flex,
    this.childView,
  }) : super(key: key);
  final String heading;
  final int flex;
  final bool childView;

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: flex,
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
                child: SvgPicture.asset('assets/images/bg-top-sm.svg',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * .5,
                  width: double.infinity,)),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: childView == true ? Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset('assets/icons/back-icon.svg'),
                                    )) : Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: SvgPicture.asset('assets/icons/user-account.svg'),
                                  ),
                                ),
                                onTap: () {
                                 if (childView == true) {
                                   Navigator.pop(context);
                                 } else {
                                   Navigator.pushNamedAndRemoveUntil(context, ProfileScreen.routeName, (route) => true);
                                 }
                              },),
                              SvgPicture.asset('assets/images/winnintips-logo-alt.svg'),
                              childView == true ? Container() : GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset('assets/icons/menu-icon.svg'),
                                  ),
                              onTap: () {
                                    Navigator.pushNamedAndRemoveUntil(context, AboutScreen.routeName, (route) => true);
                              },),
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 35),
                              child: Text(heading,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: bgColor
                                ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          ],
        )
    );
  }
}
