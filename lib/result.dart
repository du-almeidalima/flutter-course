import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function _onResetApp;
  // Just trying out named constructors
  Result.namedConstructor(this._totalScore, this._onResetApp);

  @override
  Widget build(BuildContext context) {
    String text, title;

    if (this._totalScore > 23) {
      title = 'You rock!';
      text = 'I would really like to hang out with you in the lunch time';
    } else if (this._totalScore > 15) {
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
                "Score: $_totalScore",
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
            Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text('Reset'),
                onPressed: this._onResetApp,
              ),
            )
          ],
        ));
  }
}
