import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  @required
  final Function selectHandler;

  @required
  final String answer;

  Answer({ this.selectHandler, this.answer});

  @override
  build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.cyan[600],
        child: Text(
          this.answer,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: this.selectHandler,
      ),
    );
  }
}
