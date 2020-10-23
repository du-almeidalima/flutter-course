import 'package:flutter/material.dart';

class DisplayedText extends StatelessWidget {
  final String _text;

  DisplayedText(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
      ),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 30, top: 200),
    );
  }
}
