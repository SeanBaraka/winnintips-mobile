import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winnintips/Components/prediction_list_item.dart';
import 'package:winnintips/Components/top_view.dart';
import 'package:winnintips/screens/home_screen.dart';
import 'package:winnintips/services/network_operations.dart';

class ArchivesScreen extends StatelessWidget {
  static String routeName = '/archives';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopViewWidget(heading: "Archives", flex: 1,),
            Expanded(flex: 3, child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: FutureBuilder(
                  future: getAllTips(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                          itemCount: 50,
                          itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: PredictionListItem(
                            predictionWon: snapshot.data[index]['fields']['status'],
                            isFeatured: false,
                            finished: true,
                            score: snapshot.data[index]['fields']['score'],
                            homeTeam: snapshot.data[index]['fields']['home_team'],
                            awayTeam: snapshot.data[index]['fields']['away_team'],
                            prediction: snapshot.data[index]['fields']['prediction'],
                            odds: snapshot.data[index]['fields']['prediction_odds'].toString(),
                          ),
                        );
                      });
                    } else {
                      return Container(
                        child: Center(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                    width: 30,
                                    height: 30,
                                    child: Center(child: CircularProgressIndicator(strokeWidth: 2,))),
                                SizedBox(height: 40,),
                                Text("Getting Results, hold on", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },

                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
