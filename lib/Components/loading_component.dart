import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white70,
      child: Center(
        heightFactor: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Loading... please wait", style: TextStyle(
              fontSize: 22
            ),),
            SizedBox(height: 30,),
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
        ],)
      ),
    );
  }
}
