import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winnintips/Components/top_view.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/constants/strings.dart';

class AboutScreen extends StatelessWidget {
  static String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopViewWidget(flex: 1, childView: true, heading: "About Us",),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("At winnintips predicts, we are committed to giving you sports predictions"
                      "from a dozen+ leagues and competitions across the globe", style: TextStyle(
                    fontSize: 18
                    )
                  ),
                    SizedBox(height: 40,),
                   GestureDetector(
                     onTap: () {
                       // launch telegram channel
                        launch(telegramChannelUrl);
                     },
                     child: Container(
                       height: 50,
                       child: Stack(
                         alignment: AlignmentDirectional.center,
                         children:[
                           Positioned(
                             left: 15,
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(7.5),
                                 color: strokeColor,
                               ),
                               width: MediaQuery.of(context).size.width * .6,
                               height: 50,
                             ),
                           ),
                           Row(
                             children: [
                               SvgPicture.asset('assets/icons/telegram-icon.svg'),
                               SizedBox(width: 10,),
                               Text("Join Telegram Channel", style: TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 16
                               ),)
                             ],
                           ),
                         ]
                       ),
                     ),
                   ),

                    SizedBox(height: 40,),
                    Text("Other Contacts", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    ContactRow(icon: 'assets/icons/whatsapp-icon.svg', text: '+254774995600',),
                    SizedBox(height: 20,),
                    ContactRow(icon: 'assets/icons/facebook-icon.svg', text: 'Winnintips Predicts',),
                    SizedBox(height: 20,),
                    ContactRow(icon: 'assets/icons/twitter-icon.svg', text: '@winnintipspredicts',),

                ],
            ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  const ContactRow({
    Key key,
    this.icon,
    this.text
  }) : super(key: key);
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        SizedBox(width: 20,),
        Text(text, style: TextStyle(
          fontSize: 16,
        ),)
      ],
    );
  }
}
