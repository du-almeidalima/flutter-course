import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Result extends StatelessWidget {
  final int totalScore;

  // Just trying out named constructors
  Result.namedConstructor(this.totalScore);

  @override
  Widget build(BuildContext context) {
    String text, title;

    if (this.totalScore > 23) {
      title = 'You rock!';
      text = 'I would really like to hang out with you in the lunch time';
    } else if (this.totalScore > 15) {
      title = 'Not bad...';
      text = 'Maybe you are worth the air you breath';
    } else {
      title = 'Uuuuugh!';
      text = 'You are the most despicable person how has walked on this earth';
    }

    return Container(
        margin: EdgeInsets.only(top: 200),
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "Score: $totalScore",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ));
  }
}
