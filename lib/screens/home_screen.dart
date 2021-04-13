import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:winnintips/Components/decorated_button.dart';
import 'package:winnintips/Components/prediction_list_item.dart';
import 'package:winnintips/Components/top_view.dart';
import 'package:winnintips/constants/colors.dart';
import 'package:winnintips/screens/archives_screen.dart';
import 'package:winnintips/services/network_operations.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopViewWidget(flex: 1, heading: "Featured Match",),
            Expanded(flex: 3,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    Center(
                      child: FutureBuilder(
                        future: getFeaturedMatch(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return FeaturedMatchWidget(featuredMatch: snapshot.data[0]['fields'],);
                          } else {
                            return Center(
                              child: Container(
                                child: Column(
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 20,),
                                    Text("A second, getting the featured match", style: TextStyle(
                                      fontSize: 16,
                                    ),)
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Today's Predictions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),),
                    Padding(padding: EdgeInsets.all(20),
                    child: FutureBuilder(
                      future: getRecentMatches(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 15),
                                child: PredictionListItem(
                                  isFeatured: false,
                                  homeTeam: snapshot.data[index]['fields']['home_team'],
                                  awayTeam: snapshot.data[index]['fields']['away_team'],
                                  prediction: snapshot.data[index]['fields']['prediction'],
                                  odds: snapshot.data[index]['fields']['prediction_odds'].toString()
                                ));
                          });
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Container(
                                width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator()),
                            ),
                          );
                        }
                      },
                    ),),
                    DecoratedButton(text: "Visit Our Archives", onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, ArchivesScreen.routeName, (route) => true);
                    }, primaryColor: prColor,textColor: bgColor,)
                  ],
                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}

class FeaturedMatchWidget extends StatelessWidget {
  const FeaturedMatchWidget({
    Key key,
    this.featuredMatch
  }) : super(key: key);
  final dynamic featuredMatch;

  @override
  Widget build(BuildContext context) {
    var date = featuredMatch['match_date'];
    var parsedDate = DateTime.parse(date);
    var localDate = DateFormat.yMMMEd().format(parsedDate);
    var localTime = DateFormat.Hm().format(parsedDate);
    return Column(
      children: [
        Text(localDate,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(localTime, style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600
          ),),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: PredictionListItem(
            isFeatured: true,
            homeTeam: featuredMatch['home_team'],
            awayTeam: featuredMatch['away_team'],
            prediction: featuredMatch['prediction'],
            odds: featuredMatch['prediction_odds']
          ),),
      ],
    );
  }
}
