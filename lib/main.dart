import 'package:assignment_one/text-control.dart';
import 'package:assignment_one/text.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  final textList = const [
    "Hey Dude",
    "Don't make it bad",
    "Do a backflip",
    "And you'll feel better",
    "The minute, you let the swag into your skin",
    "Then you begin to make it better"
  ];

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _textIndex = 0;

  void onChangeText() {
    if (this._textIndex < widget.textList.length - 1) {
      setState(() {
        _textIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Assignment 1'),
          ),
          body: Column(
            children: [
              DisplayedText(widget.textList[_textIndex]),
              TextControl(this.onChangeText),
            ],
          )),
    );
  }
}
