import 'package:flutter/material.dart';
import 'package:winnintips/Components/team_tag.dart';
import 'package:winnintips/constants/colors.dart';

class PredictionListItem extends StatelessWidget {
  const PredictionListItem({
    Key key,
    this.predictionWon,
    this.isFeatured,
    this.homeTeam,
    this.awayTeam,
    this.prediction,
    this.odds,
    this.finished,
    this.score
  }) : super(key: key);
  final bool isFeatured, finished, predictionWon;
  final String homeTeam, awayTeam, prediction,odds, score;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: TeamTagWidget(isFeatured: isFeatured,labelText: "Home Team", teamName: homeTeam,)),
            Spacer(),
            Expanded(child: TeamTagWidget(isFeatured: isFeatured, labelText: "Away Team", teamName: awayTeam,))
          ],
        ),
        SizedBox(height: isFeatured ? 15 : 10),
        finished != true ? Text("Pick: $prediction \t\t $odds", style: TextStyle(
            fontSize: isFeatured ? 16 : 14,
            fontWeight: FontWeight.bold
        ),) : Text("Pick: $prediction \t Final Score $score", style: TextStyle(
          color: predictionWon == true ? Colors.green : predictionWon == false ? Colors.red : dkGreyColor,
          fontWeight: predictionWon == true ? FontWeight.w600 : FontWeight.normal
        ),)
      ],
    );
  }
}
