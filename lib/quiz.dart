import 'package:flutter/material.dart';
import 'package:flutter_first_app/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {

  final Function _onAnswerSelected;
  final Map<String, Object> question;

  Quiz(this.question, this._onAnswerSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Question(question['title']),
        // Similar to React, we're mapping a list to Widgets
        ...(question['answers'] as List<String>)
            .map((answer) => Answer(
                  selectHandler: this._onAnswerSelected,
                  answer: answer,
                ))
            .toList()
      ]),
    );
  }
}
