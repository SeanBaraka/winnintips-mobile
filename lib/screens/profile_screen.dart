import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:winnintips/Components/decorated_button.dart';
import 'package:winnintips/Components/top_view.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/services/network_operations.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final InAppPurchaseConnection _connection = InAppPurchaseConnection.instance;
  List<PurchaseDetails> _purchases = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopViewWidget(flex: 1, heading: "User Account",childView: true,),
            FutureBuilder(
              future: getLoggedInUser(),
              builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text("${snapshot.data['first_name']} ${snapshot.data['last_name']}", style: TextStyle(fontSize: 28),),
                            SizedBox(height: 10,),
                            Text("${snapshot.data['telephone']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Text("${snapshot.data['location']}",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 30,),
                            Text("Subscription Status",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(height: 30,),
                            snapshot.data['is_vip'] == true ? Text("You are Premium 🎉",style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)) : Text("Free Plan",style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
                            SizedBox(height:40,),
                            snapshot.data['is_vip'] != true ?
                            DecoratedButton(text: "Join Premium Membership" ,onPressed: () =>{},primaryColor: brightOrange, textColor: prColor,) : Container()
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      flex: 3,
                      child: Container(
                        child: Center(
                          child: Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20,),
                              Text("Loading Profile🤏🤏", style: TextStyle(
                                fontSize: 20
                              ),)
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              },
                          )
          ],
        ),
      ),
    );
  }
}
